require_relative 'av_class'
require_relative 'av_codec_id'
require_relative 'av_codec_tag'


module FFI
  module FFmpeg
    class AVOutputFormat < FFI::Struct
      layout :name,             :string,
        :long_name,             :string,
        :mime_type,             :string,
        :extensions,            :string,
        :audio_codec,           AVCodecID,
        :video_codec,           AVCodecID,
        :subtitle_codec,        AVCodecID,
        :flags,                 :int,
        :codec_tag,             AVCodecTag.ptr,
        :priv_class,            AVClass.ptr,
        :next,                  AVOutputFormat.ptr,
        :priv_data_size,        :int,
        :write_header,          :pointer,
        :write_packet,          :pointer,
        :write_trailer,         :pointer,
        :interleave_packet,     :pointer,
        :query_codec,           :pointer,
        :get_output_timestamp,  :pointer
    end
  end
end
