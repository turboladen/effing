require_relative 'av_codec_context'
require_relative 'av_dictionary'
require_relative 'av_pan_scan'
require_relative 'av_picture_type'
require_relative 'av_rational'


module FFI
  module FFmpeg
    class AVFrame < FFI::Struct
      layout  :data,                    [:pointer, AV_NUM_DATA_POINTERS],
              :linesize,                [:int, AV_NUM_DATA_POINTERS],
              :extended_data,           :pointer,
              :width,                   :int,
              :height,                  :int,
              :nb_samples,              :int,
              :format,                  :int,
              :key_frame,               :int,
              :pict_type,               AVPictureType,
              :base,                    [:pointer, AV_NUM_DATA_POINTERS],
              :sample_aspect_ratio,     AVRational,
              :pts,                     :int64,
              :pkt_pts,                 :int64,
              :pkt_dts,                 :int64,
              :coded_picture_number,    :int,
              :display_picture_number,  :int,
              :quality,                 :int,
              :reference,               :int,
              :qscale_table,            :pointer,
              :qstride,                 :int,
              :qscale_type,             :int,
              :mbskip_table,            :pointer,
              :motion_val,              [:pointer, 2],
              :mb_type,                 :pointer,
              :dct_coeff,               :pointer,
              :ref_index,               [:pointer, 2],
              :opaque,                  :pointer,
              :error,                   [:uint64, AV_NUM_DATA_POINTERS],
              :type,                    :int,
              :repeat_pict,             :int,
              :interlaced_frame,        :int,
              :top_field_first,         :int,
              :palette_has_changed,     :int,
              :buffer_hints,            :int,
              :pan_scan,                AVPanScan.ptr,
              :reordered_opaque,        :int64,
              :hwaccel_picture_private, :pointer,
              :owner,                   :pointer,     # The owning AVCodecContext
              :thread_opaque,           :pointer,
              :motion_subsample_log2,   :uint8,
              :sample_rate,             :int,
              :channel_layout,          :uint64,
              :best_effort_timestamp,   :int64,
              :pkt_pos,                 :int64,
              :pkt_duration,            :int64,
              :metadata,                AVDictionary.ptr,
              :decode_error_flags,      :int,
              :channels,                :int64,
              :pkt_size,                :int

      def to_hash
        hash = {}

        members.each_with_index do |member, i|
          value = values.at(i)

          hash[member] = case value.class.name
          when 'FFI::FFmpeg::AVRational'
            value[:den].zero? ? value[:num] : value.to_f
          when 'FFI::FFmpeg::AVFrac'
            value[:den].zero? ? value[:val] : value.to_f
          else
            value
          end
        end

        hash
      end
    end
  end
end
