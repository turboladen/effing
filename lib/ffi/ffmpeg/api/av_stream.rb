require_relative 'av_codec_context'
require_relative 'av_codec_parser_context'
require_relative 'av_dictionary'
require_relative 'av_discard'
require_relative 'av_frac'
require_relative 'av_index_entry'
require_relative 'av_packet'
require_relative 'av_packet_list'
require_relative 'av_probe_data'
require_relative 'av_rational'
require_relative 'av_stream_parse_type'


module FFI
  module FFmpeg
    class Info < FFI::Struct
      layout :last_dts,             :int64,
             :duration_gcd,         :int64,
             :duration_count,       :int,
             #:duration_error, [:double, 2],
             :duration_error,       :double,
             :codec_info_duration,  :int64,
             :codec_info_duration_fields, :int64,
             :found_decoder,        :int,
             :fps_first_dts,        :int64,
             :fps_first_dts_idx,    :int,
             :fps_last_dts,         :int64,
             :fps_last_dts_idx,     :int
    end

    class AVStream < FFI::Struct
      layout  :index,                     :int,
              :id,                        :int,
              :codec,                     AVCodecContext.ptr,
              :priv_data,                 :pointer,
              :pts,                       AVFrac,
              :time_base,                 AVRational,
              :start_time,                :int64,
              :duration,                  :int64,
              :nb_frames,                 :int64,
              :disposition,               :int,
              :discard,                   AVDiscard,
              :sample_aspect_ratio,       AVRational,
              :metadata,                  AVDictionary.ptr,
              :avg_frame_rate,            AVRational,
              :attached_pic,              AVPacket,
              :info,                      Info.ptr,
              :pts_wrap_bits,             :int,
              :reference_dts,             :int64,
              :first_dts,                 :int64,
              :cur_dts,                   :int64,
              :last_IP_pts,               :int64,
              :last_IP_duration,          :int,
              :probe_packets,             :int,
              :codec_info_nb_frames,      :int,
              :stream_identifier,         :int,
              :interleaver_chunk_size,    :int64,
              :interleaver_chunk_duration, :int64,
              :need_parsing,              AVStreamParseType,
              :parser,                    AVCodecParserContext.ptr,
              :last_in_packet_buffer,     AVPacketList.ptr,
              :probe_data,                AVProbeData,
              :pts_buffer,                [:int64, MAX_REORDER_DELAY + 1],
              :index_entries,             AVIndexEntry.ptr,
              :nb_index_entries,          :int,
              :index_entries_allocated_size, :uint,
              :request_probe,             :int,
              :skip_to_keyframe,          :int,
              :skip_samples,              :int,
              :nb_decoded_frames,         :int,
              :mux_ts_offset,             :int64
              #:pts_wrap_reference,        :int64, # new!
              #:pts_wrap_behavior,         :int   #new

      def to_s
        '#<AVStream:0x%08x index=%d, id=%d, codec_type=:%s>' %
            [ object_id, self[:index], self[:id], self[:codec][:codec_type] ]
      end

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

      def discard=(type)
        send(:[]=, :discard, type)
      end
    end
  end
end
