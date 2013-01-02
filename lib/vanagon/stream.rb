require_relative '../ffi/ffmpeg'
require_relative 'logger'
require 'pp'


class Vanagon
  class Stream
    include FFI::FFmpeg
    include LogSwitch::Mixin

    attr_reader :av_stream, :av_codec_context

    def initialize(av_stream, av_format_context)
      @av_stream = av_stream
      @av_format_context = av_format_context
      @av_codec_context = AVCodecContext.new(@av_stream[:codec])

      # open the codec
      codec = avcodec_find_decoder(@av_codec_context[:codec_id])

      if codec.null?
        raise RuntimeError, "No decoder found for #{@av_codec_context[:codec_id]}"
      end

      #avcodec_open(@av_codec_context, codec) == 0 or
      #  raise RuntimeError, "avcodec_open() failed"
      rc = avcodec_open2(@av_codec_context, codec, nil)
      raise "Couldn't open codec" if rc < 0

      # Set up finalizer to free up resources
      ObjectSpace.define_finalizer(self, self.class.method(:finalize).to_proc)
    end

    def self.finalize(id)
      avcodec_close(@av_codec_context)
    end

    def discard=(value)
      @av_stream[:discard] = value
    end

    def discard
      @av_stream[:discard]
    end

    def type
      @av_codec_context[:codec_type]
    end

    def index
      @av_stream[:index]
    end

    def decode_frame(packet)
      return false
      raise NotImplementedError, "decode_frame() not defined for #{self.class}"
    end

    def each_frame(&block)
      raise ArgumentError, "No block provided" unless block_given?

      av_packet = AVPacket.new
      av_init_packet(av_packet)
      av_packet[:data] = nil
      av_packet[:size] = 0

      while av_read_frame(@av_format_context, av_packet) >= 0
        log "Packet from stream number #{av_packet[:stream_index]}"

        if av_packet[:stream_index] == index
          frame = decode_frame(av_packet)
          rc = frame ? yield(frame) : true
        end

        av_free_packet(av_packet)

        break if rc == false
      end
    end

    # Use for demuxing the stream without decoding it.  It yields each packet
    # as it is read.  The only difference between this and #each_frame is that
    # #each_frame decodes each packet and yields frames held in the packet.
    def each_packet(&block)
      raise ArgumentError, "No block provided" unless block_given?

      av_packet = AVPacket.new
      av_init_packet(av_packet)
      av_packet[:data] = nil
      av_packet[:size] = 0

      while av_read_frame(@av_format_context, av_packet) >= 0
        log "Packet from stream number #{av_packet[:stream_index]}"

        if av_packet[:stream_index] == index
          yield(av_packet) unless av_packet.null?
        end

        av_free_packet(av_packet)
      end
    end

    # Video duration in (fractional) seconds.
    #
    # @return [Float] The format context's duration divided by AV_TIME_BASE.
    def duration
      @duration ||= @av_stream[:duration].to_f / AV_TIME_BASE
    end
  end
end


require_relative 'video_stream'
