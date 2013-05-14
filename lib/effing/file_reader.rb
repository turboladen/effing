require_relative '../ffi/ffmpeg'
require_relative 'streams/audio_stream'
require_relative 'streams/video_stream'
require_relative 'logger'


class Effing
  class FileReader
    include LogSwitch::Mixin
    include FFI::FFmpeg
    include Effing::Streams

    attr_reader :streams, :av_format_context

    # @param [String] filename Path of the file to open.
    def initialize(filename)
      @filename = filename
      @streams = []

      FFI::FFmpeg.av_register_all
      FFI::FFmpeg.av_log_set_level(:debug) if Effing.log?

      if @filename && File.exists?(@filename)
        open_file(@filename)
      else
        raise "Can't find file '#{@filename}'"
      end

      find_stream_info
      initialize_streams
    end

    # Opens the A/V file using FFmpeg.avformat_open_input.
    #
    # @param [String] filename Name/path of the A/V file to read.
    # @raise [RuntimeError] If FFmpeg wasn't able to open the file.
    def open_file(filename)
      @av_format_context = FFI::MemoryPointer.new(:pointer)
      return_code = FFI::FFmpeg.avformat_open_input(@av_format_context, filename, nil, 0, nil)

      unless return_code.zero?
        raise RuntimeError,
          "FFI::FFmpeg.av_open_input_file() failed, filename='%s', rc=%d" %
          [filename, return_code]
      end

      @av_format_context =
        FFI::FFmpeg::AVFormatContext.new(@av_format_context.get_pointer(0))
    end

    # Gets info about the streams in the file.
    #
    # @raise [RuntimeError] If FFmpeg wasn't able to find stream info.
    def find_stream_info
      return_code = if defined?(FFI::FFmpeg.av_find_stream_info)
        FFI::FFmpeg.av_find_stream_info(@av_format_context)
      else
        FFI::FFmpeg.avformat_find_stream_info(@av_format_context, nil)
      end

      if return_code < 0
        raise RuntimeError,
          "FFI::Ffmpeg.av_find_stream_info() failed, rc=#{return_code}"
      end

      log "Stream count: #{@av_format_context[:nb_streams]}"
      log "File duration: #{duration}"
      log "Position of first frame: #{@av_format_context[:start_time]}"
      log "Start time, real time: #{@av_format_context[:start_time_realtime]}"
      log "Offset of first frame: #{@av_format_context[:data_offset]}"
      log "Max chunk duration: #{@av_format_context[:max_chunk_duration]}"
      log "Max chunk size: #{@av_format_context[:max_chunk_size]}"
      log "Max index size: #{@av_format_context[:max_index_size]}"
      log "Max picture buffer: #{@av_format_context[:max_picture_buffer]}"
      log "Packet size: #{@av_format_context[:packet_size]}"
      log "Total stream bit rate: #{@av_format_context[:bit_rate]}"
    end

    # Wrapper for FFmpeg's .av_dump_format, outputting metadata about the file's
    # streams.
    def dump_format
      if old_api?
        FFI::FFmpeg.dump_format(@av_format_context, 0, @filename, 0)
      else
        FFI::FFmpeg.av_dump_format(@av_format_context, 0, @filename, 0)
      end
    end

    # Video duration in (fractional) seconds.
    #
    # @return [Float] The format context's duration divided by AV_TIME_BASE.
    def duration
      @duration ||= @av_format_context[:duration].to_f / AV_TIME_BASE
    end

    #---------------------------------------------------------------------------
    # Privates
    #---------------------------------------------------------------------------
    private

    def initialize_streams
      av_streams = @av_format_context[:streams].
        read_array_of_pointer(@av_format_context[:nb_streams])

      av_streams.each_with_index do |av_stream_pointer, i|
        log "Reading stream #{i}..."

        av_stream = FFI::FFmpeg::AVStream.new(av_stream_pointer)
        log "Codec name: #{av_stream[:codec][:codec_name]}"
        log "Codec type: #{av_stream[:codec][:codec_type]}"

        case av_stream[:codec][:codec_type]
        when :video
          log 'Video stream'
          @streams << VideoStream.new(av_stream, @av_format_context)
        when :audio
          log 'Audio stream'
          @streams << AudioStream.new(av_stream, @av_format_context)
        else
          warn "Unsupported stream type: #{av_stream[:codec][:codec_type]}"
        end

        log "Done reading stream #{i}."
      end
    end
  end
end
