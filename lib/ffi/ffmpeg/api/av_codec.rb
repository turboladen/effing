require_relative 'av_class'
require_relative 'av_codec_default'
require_relative 'av_codec_id'
require_relative 'av_media_type'
require_relative 'av_profile'
require_relative 'av_rational'
require_relative 'av_sample_format'


module FFI
  module FFmpeg
    class AVCodec < FFI:: Struct
      layout :name,             :string,
        :long_name,             :string,
        :type,                  AVMediaType,
        :id,                    AVCodecID,
        :capabilities,          :int,
        :supported_framerates,  AVRational.ptr,
        :pix_fmts,              :pointer,     # To AVSampleFormat
        :supported_samplerates, :pointer,
        :sample_fmts,           :pointer,     # To AVSampleFormat
        :channel_layouts,       :pointer,
        :max_lowres,            :uint8,
        :priv_class,            AVClass.ptr,
        :profiles,              :pointer,     # To array of AVProfiles
        :priv_data_size,        :int,
        :next,                  AVCodec.ptr,
        :defaults,              :pointer,     # To array of AVCodecDefaults
        :init_static_data,      :pointer,
        :init,                  :pointer,
        :encode_sub,            :pointer,
        :encode2,               :pointer,
        :decode,                :pointer,
        :close,                 :pointer,
        :flush,                 :pointer,
        :init_thread_copy,      :pointer,
        :update_thread_context, :pointer
    end
  end
end
