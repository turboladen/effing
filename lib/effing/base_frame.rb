require_relative 'logger'
require_relative '../ffi/ffmpeg'


class Effing

  # The base class for other frames to use.  It provides creating a AVFrame and
  # for freeing related memory when the object goes out of scope.
  class BaseFrame
    include LogSwitch::Mixin

    # @return [FFI::FFmpeg::AVFrame] The struct provided by FFmpeg that contains
    #   A/V data about the frame.
    attr_reader :av_frame

    def initialize
      init_frame
      ObjectSpace.define_finalizer(self, method(:finalize).to_proc)
    end

    # Tells if the current frame is a key frame or not.
    #
    # @return [Boolean] True if the frame is a key frame.
    def key_frame?
      @av_frame[:key_frame] == 1
    end

    #---------------------------------------------------------------------------
    # Privates
    #---------------------------------------------------------------------------
    private

    # Creates the AVFrame for use with FFmpeg.
    def init_frame
      @av_frame = FFI::FFmpeg.avcodec_alloc_frame

      if @av_frame.to_i < 0
        raise NoMemoryError, "avcodec_alloc_frame() failed"
      end

      @av_frame = FFI::FFmpeg::AVFrame.new(@av_frame)
    end

    # Method that gets called when self is destroyed.  Used for handling freeing
    # memory for FFmpeg.
    def finalize
      FFI::FFmpeg.av_free(@av_frame)
    end
  end
end
