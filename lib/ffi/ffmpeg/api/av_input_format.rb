require_relative 'av_class'
require_relative 'av_codec_tag'


module FFI
  module FFmpeg
    class AVInputFormat < FFI::Struct
      layout :name,       :string,
        :long_name,       :string,
        :flags,           :int,
        :extensions,      :string,
        :codec_tag,       AVCodecTag.ptr,
        :priv_class,      AVClass.ptr,
        :next,            AVInputFormat.ptr,
        :raw_codec_id,    :int,
        :priv_data_size,  :int,
        :read_probe,      :pointer,
        :read_header,     :pointer,
        :read_packet,     :pointer,
        :read_close,      :pointer,
        :read_seek,       :pointer,
        :read_timestamp,  :pointer,
        :read_play,       :pointer,
        :read_pause,      :pointer,
        :read_seek2,      :pointer
    end
  end
end
