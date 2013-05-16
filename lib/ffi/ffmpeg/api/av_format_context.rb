require_relative 'av_class'
require_relative 'av_codec_id'
require_relative 'av_dictionary'
require_relative 'av_duration_estimation_method'
require_relative 'av_input_format'
require_relative 'av_io_context'
require_relative 'av_io_interrupt_cb'
require_relative 'av_output_format'
require_relative 'av_packet_list'


module FFI
  module FFmpeg
    class AVFormatContext < FFI::Struct
      layout  :av_class,            AVClass.ptr,
              :iformat,             AVInputFormat.ptr,
              :oformat,             AVOutputFormat.ptr,
              :priv_data,           :pointer,
              :pb,                  AVIOContext.ptr,
              :ctx_flags,           :int,
              :nb_streams,          :uint,
              :streams,             :pointer,
              :filename,            [:char, 1024],
              :start_time,          :int64,
              :duration,            :int64,
              :bit_rate,            :int,
              :packet_size,         :uint,
              :max_delay,           :int,
              :flags,               :int,
              :probesize,           :uint,
              :max_analyze_duration,:int,
              :key,                 :pointer,
              :keylen,              :int,
              :nb_programs,         :uint,
              :programs,            :pointer,
              :video_codec_id,      AVCodecID,
              :audio_codec_id,      AVCodecID,
              :subtitle_codec_id,   AVCodecID,
              :max_index_size,      :uint,
              :max_picture_buffer,  :uint,
              :nb_chapters,         :uint,
              :chapters,            :pointer,
              :metadata,            AVDictionary.ptr,
              :start_time_realtime, :int64,
              :fps_probe_size,      :int,       # new!
              :error_recognition,   :int,       # new!
              :interrupt_callback,  AVIOInterruptCB,       # new!
              :debug,               :int,
              :ts_id,               :int,         # new!
              :audio_preload,       :int,         # new!
              :max_chunk_duration,  :int,    # new!
              :max_chunk_size,      :int,   # new!
              :use_wallclock_as_timestamps,   :int,     # new!
              :avoid_negative_ts,   :int,     # new!
              :avio_flags,          :int,           # new!
              :duration_estimation_method, AVDurationEstimationMethod,  # new
              #:skip_initial_bytes,  :uint,    # new!
              #:correct_ts_overflow, :uint,    # new!
              :packet_buffer,       AVPacketList.ptr,
              :packet_buffer_end,   AVPacketList.ptr,
              :data_offset,         :int64,
              :raw_packet_buffer,   AVPacketList.ptr,
              :raw_packet_buffer_end, AVPacketList.ptr,
              :parse_queue,         AVPacketList.ptr,       # new!
              :parse_queue_end,     AVPacketList.ptr,     # new!
              :raw_packet_buffer_remaining_size, :int

=begin
              :timestamp,     :long_long,
              :title,         [:char, 512],
              :author,        [:char, 512],
              :copyright,     [:char, 512],
              :comment,       [:char, 512],
              :album,         [:char, 512],
              :year,          :int,
              :track,         :int,
              :genre,         [:char, 32],
              :file_size,     :long_long,
              :cur_st,        :pointer,
              :cur_ptr_deprecated,  :pointer,
              :cur_len_deprecated,  :int,
              :cur_pkt_deprecated,  AVPacket,
              :index_build,   :int,
              :mux_rate,      :int,
              :loop_output,   :int,
              :loop_input,    :int,
=end


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
