require_relative 'av_codec_id'


module FFI
  module FFmpeg
    class AVCodecTag < FFI::Struct
      layout :id, AVCodecID,
        :tag, :uint
    end
  end
end
