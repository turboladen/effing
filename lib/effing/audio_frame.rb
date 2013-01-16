require_relative 'logger'
require_relative '../ffi/ffmpeg'


class Effing
  class AudioFrame
    include FFI::FFmpeg
    include LogSwitch::Mixin

    attr_reader :av_frame

    def initialize
      init_frame
      ObjectSpace.define_finalizer(self, method(:finalize).to_proc)
    end

    def key_frame?
      @av_frame[:key_frame] == 1
    end

    private

    def init_frame
      @av_frame = avcodec_alloc_frame
      raise NoMemoryError "avcodec_alloc_frame() failed" unless @av_frame
      @av_frame = AVFrame.new(@av_frame)
    end

    def finalize(id)
      av_free(@av_frame)
    end
  end
end