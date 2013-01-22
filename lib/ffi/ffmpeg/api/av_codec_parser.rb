module FFI
  module FFmpeg
    class AVCodecParser < FFI::Struct
      layout :codec_ids,  [:int, 5],
        :priv_data_size,  :int,
        :parser_init,     :pointer,
        :parser_parse,    :pointer,
        :parser_close,    :pointer,
        :split,           :pointer,
        :next,            AVCodecParser.ptr
    end
  end
end
