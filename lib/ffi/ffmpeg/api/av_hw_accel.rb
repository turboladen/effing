require_relative 'av_codec_id'
require_relative 'av_media_type'
require_relative 'av_pixel_format'


module FFI
  module FFmpeg
    class AVHWAccel < FFI::Struct
      layout :name,     :string,
        :type,          AVMediaType,
        :id,            AVCodecID,
        :pxl_fmt,       AVPixelFormat,
        :capabilities,  :int,
        :next,          AVHWAccel.ptr,
        :start_frame,   :pointer,
        :decode_slice,  :pointer,
        :end_frame,     :pointer,
        :priv_data_size, :int
    end
  end
end
