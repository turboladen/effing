require_relative 'logger'
require_relative 'stream'
require_relative 'frames/audio_frame'


class Effing
  class AudioStream < Effing::Stream
    include LogSwitch::Mixin

    attr_reader :raw_frame

    def initialize(av_stream, av_format_context)
      super(av_stream, av_format_context)

      @raw_frame = Effing::Frames::AudioFrame.new
    end

    def decode_frame(packet)
      len = if FFI::FFmpeg.old_api?
        abort "Audio decoding not implemented for old FFmpeg API"
      else
        avcodec_decode_audio4(@av_codec_context, @raw_frame.av_frame,
          @frame_finished, packet)
      end

      if len > 0
        log "Read bytes: #{len}"
      elsif len.zero?
        warn "Couldn't decompress frame"
      else
        warn "Negative return on decompressing frame; could be an error..."
      end

      if @frame_finished.read_int >= 0
        log "Frame info:"
        log "\tSample count: #{@raw_frame.av_frame[:nb_samples]}"
        log "\tpts: #{@raw_frame.av_frame[:pts]}"
        log "\ttime base: #{@raw_frame.av_frame[:time_base]}"
        return @raw_frame
      else
        log "frame_finished: #{@frame_finished.read_int}"
      end
    end
  end
end
