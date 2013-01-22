require_relative 'av_codec_id'
require_relative 'av_media_type'


module FFI
  module FFmpeg
    class AVCodecDescriptor < FFI::Struct
      layout :id,   AVCodecID,
        :type,      AVMediaType,
        :name,      :string,
        :long_name, :string,
        :props,     :int
    end
  end
end
