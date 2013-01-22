require_relative 'av_codec_parser'


module FFI
  module FFmpeg
    class AVCodecParserContext < FFI::Struct
      layout :priv_data,    :pointer,
        :parser,            AVCodecParser.ptr,
        :frame_offset,      :int64,
        :cur_offset,        :int64,
        :next_frame_offset, :int64,
        :pict_type,         :int,
        :repeat_pict,       :int,
        :pts,               :int64,
        :dts,               :int64,
        :last_pts,          :int64,
        :last_dts,          :int64,
        :fetch_timestamp,   :int,
        :cur_frame_start_index, :int,
        :cur_frame_offset,  [:int64, AV_PARSER_PTS_NB],
        :cur_frame_pts,     [:int64, AV_PARSER_PTS_NB],
        :cur_frame_dts,     [:int64, AV_PARSER_PTS_NB],
        :flags,             :int,
        :offset,            :int64,
        :cur_frame_end,     [:int64, AV_PARSER_PTS_NB],
        :key_frame,         :int,
        :convergence_duration, :int64,
        :dts_sync_point,    :int,
        :dts_ref_dts_delta, :int,
        :pts_dts_delta,     :int,
        :cur_frame_pos,     [:int64, AV_PARSER_PTS_NB],
        :pos,               :int64,
        :last_pos,          :int64,
        :duration,          :int
    end
  end
end
