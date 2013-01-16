require_relative '../ffi/ffmpeg'
require_relative 'logger'


class Effing
  class Stream
    include FFI::FFmpeg
    include LogSwitch::Mixin

    # @return [FFI::FFmpeg::AVStream]
    attr_reader :av_stream

    # @return [FFI::FFmpeg::AVCodecContext]
    attr_reader :av_codec_context

    # @param [FFI::FFmpeg::AVStream] av_stream
    # @param [FFI::FFmpeg::AVFormatContext] av_format_context
    def initialize(av_stream, av_format_context)
      @av_stream = av_stream
      @av_format_context = av_format_context
      @av_codec_context = @av_stream[:codec]

      # open the codec
      codec = avcodec_find_decoder(@av_codec_context[:codec_id])

      if codec.null? || codec.nil?
        raise RuntimeError, "No decoder found for #{@av_codec_context[:codec_id]}"
      end

      if old_api?
        avcodec_open(@av_codec_context, codec) == 0 or
          raise RuntimeError, "avcodec_open() failed"
      else
        rc = avcodec_open2(@av_codec_context, codec, nil)
        raise "Couldn't open codec" if rc < 0
      end

      @frame_finished = FFI::MemoryPointer.new(:int)

      # Set up finalizer to free up resources
      ObjectSpace.define_finalizer(self, self.class.method(:finalize).to_proc)
    end

    # Use to set the types of frames to discard when demuxing. Refer to
    # http://ffmpeg.org/doxygen/trunk/group__lavc__decoding.html#ga352363bce7d3ed82c101b3bc001d1c16.
    #
    # Options are:
    #   * :none
    #   * :default
    #   * :nonref
    #   * :bidir
    #   * :nonkey
    #   * :all
    def discard=(value)
      @av_stream[:discard] = value
    end

    # Shows which packets will be discarded (and won't be demuxed).
    #
    # @return [Symbol]
    def discard
      @av_stream[:discard]
    end

    # The elemental A/V type of stream (i.e. audio, video, etc.).
    #
    # @return [Stream]
    def type
      @av_codec_context[:codec_type]
    end

    # The long name for the codec (i.e. '3vix D4 4.5.1').
    #
    # @return [String]
    def codec_name
      @av_stream.codec[:codec_name]
    end

    # The general type of codec (i.e. mpeg4).
    #
    # @return [Synbol]
    def codec_id
      @av_stream.codec[:codec_id]
    end

    # Position in the file in which the stream exists.
    def index
      @av_stream[:index]
    end

    # Average bit rate for the stream (if set).
    #
    # @return [Fixnum]
    def bit_rate
      @av_stream.bit_rate
    end

    def frame_rate
      1 / time_base
    end

    # This is the fundamental unit of time (in seconds) in terms of which frame
    # timestamps are represented.
    #
    # @return [Float]
    def time_base
      @av_codec_context.time_base
    end

    def decode_frame(packet)
      return false
      raise NotImplementedError, "decode_frame() not defined for #{self.class}"
    end

    # Used for decoding the stream into raw frames.
    #
    # @param [Proc] callback Block that gets called after all packets have been
    #   read.
    def each_frame(callback=nil, &frame_block)
      raise ArgumentError, "No block provided" unless block_given?

      av_packet = AVPacket.new
      av_init_packet(av_packet)
      av_packet[:data] = nil
      av_packet[:size] = 0

      while av_read_frame(@av_format_context, av_packet) >= 0
        if av_packet[:stream_index] == index
          #frame = decode_frame(av_packet)
          frame = frame_block.call(decode_frame(av_packet)) unless av_packet.null?
          rc = frame ? yield(frame) : true
        end

        av_free_packet(av_packet)

        break if rc == false
      end

      callback.call if callback
    end

    # Use for demuxing the stream without decoding it.  It yields each packet
    # as it is read.  The only difference between this and #each_frame is that
    # #each_frame decodes each packet and yields frames held in the packet.
    #
    # @param [Proc] callback Block that gets called after all packets have been
    #   read.
    def each_packet(callback=nil, &packet_block )
      raise ArgumentError, "No block provided" unless block_given?

      av_packet = AVPacket.new
      av_init_packet(av_packet)
      av_packet[:data] = nil
      av_packet[:size] = 0

      while av_read_frame(@av_format_context, av_packet) >= 0
        if av_packet[:stream_index] == index
          #yield(av_packet) unless av_packet.null?
          packet_block.call(av_packet) unless av_packet.null?
        end

        av_free_packet(av_packet)
      end

      callback.call if callback
    end

    # Video duration in (fractional) seconds.
    #
    # @return [Float] The format context's duration divided by AV_TIME_BASE.
    def duration
      @duration ||= @av_stream[:duration].to_f / AV_TIME_BASE
    end

    private

    def self.finalize(id)
      avcodec_close(@av_codec_context)
    end
  end
end
