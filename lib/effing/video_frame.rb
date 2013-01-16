require_relative 'base_frame'


class Effing
  class VideoFrame < BaseFrame
    include LogSwitch::Mixin

    attr_reader :width, :height, :pixel_format

    # @param [Fixnum] width Width of the picture.
    # @param [Fixnum] height Height of the picture.
    # @param [Fixnum,Symbol] pixel_format Can use the Fixnum that represents the
    #   FFmpeg AVPixelFormat enum, or you can use the Symbol that corresponds
    #   to the enum remapping defined in FFI::FFmpeg::AVPixelFormat.
    def initialize(width, height, pixel_format)
      @width = width
      @height = height
      @pixel_format = pixel_format

      super()
    end
  end
end
