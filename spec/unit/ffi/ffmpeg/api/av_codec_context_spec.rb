require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_codec_context'


describe FFI::FFmpeg::AVCodecContext do
  subject do
    FFI::FFmpeg::AVCodecContext.new
  end

  context 'default values' do
    describe 'av_class' do
      specify { subject[:av_class].should be_a FFI::FFmpeg::AVClass }
    end

    describe 'log_level_offset' do
      specify { subject[:log_level_offset].should == 0 }
    end

    describe 'codec_type' do
      specify { subject[:codec_type].should == :video }
    end

    describe 'codec' do
      specify { subject[:codec].should be_a FFI::FFmpeg::AVCodec }
    end

    describe 'codec_name' do
      specify { subject[:codec_name].should be_a FFI::StructLayout::CharArray }
      specify { subject[:codec_name].size.should == 32 }
    end

    describe 'codec_id' do
      specify { subject[:codec_id].should == :none }
    end

    describe 'codec_tag' do
      specify { subject[:codec_tag].should == 0 }
    end

    describe 'stream_codec_tag' do
      specify { subject[:stream_codec_tag].should == 0 }
    end

    describe 'priv_data' do
      specify { subject[:priv_data].should be_a FFI::Pointer }
      specify { subject[:priv_data].address.should == 0 }
    end

    describe 'internal' do
      specify { subject[:internal].should be_a FFI::Pointer }
      specify { subject[:internal].address.should == 0 }
    end

    describe 'opaque' do
      specify { subject[:opaque].should be_a FFI::Pointer }
      specify { subject[:opaque].address.should == 0 }
    end

    describe 'bit_rate' do
      specify { subject[:bit_rate].should == 0 }
    end

    describe 'bit_rate_tolerance' do
      specify { subject[:bit_rate_tolerance].should == 0 }
    end

    describe 'global_quality' do
      specify { subject[:global_quality].should == 0 }
    end

    describe 'compression_level' do
      specify { subject[:compression_level].should == 0 }
    end

    describe 'flags' do
      specify { subject[:flags].should == 0 }
    end

    describe 'flags2' do
      specify { subject[:flags2].should == 0 }
    end

    describe 'extradata' do
      specify { subject[:extradata].should be_a FFI::Pointer }
      specify { subject[:extradata].address.should == 0 }
    end

    describe 'extradata_size' do
      specify { subject[:extradata_size].should == 0 }
    end

    describe 'time_base' do
      specify { subject[:time_base].should be_a FFI::FFmpeg::AVRational }
    end

    describe 'ticks_per_frame' do
      specify { subject[:ticks_per_frame].should == 0 }
    end

    describe 'delay' do
      specify { subject[:delay].should == 0 }
    end

    describe 'width' do
      specify { subject[:width].should == 0 }
    end

    describe 'height' do
      specify { subject[:height].should == 0 }
    end

    describe 'codec_width' do
      specify { subject[:coded_width].should == 0 }
    end

    describe 'codec_height' do
      specify { subject[:coded_height].should == 0 }
    end

    describe 'gop_size' do
      specify { subject[:coded_height].should == 0 }
    end

    describe 'pix_fmt' do
      specify { subject[:pix_fmt].should == :yuv420p }
    end

    describe 'me_method' do
      specify { subject[:me_method].should == 0 }
    end

    describe 'draw_horiz_band' do
      specify { subject[:draw_horiz_band].should be_a FFI::Pointer }
      specify { subject[:draw_horiz_band].address.should == 0 }
    end

    describe 'get_format' do
      specify { subject[:get_format].should be_a FFI::Pointer }
      specify { subject[:get_format].address.should == 0 }
    end

    describe 'max_b_frames' do
      specify { subject[:max_b_frames].should == 0 }
    end

    describe 'b_quant_factor' do
      specify { subject[:b_quant_factor].should == 0.0 }
    end

    describe 'rc_strategy' do
      specify { subject[:rc_strategy].should == 0 }
    end

    describe 'b_frame_strategy' do
      specify { subject[:b_frame_strategy].should == 0 }
    end

    describe 'b_quant_offset' do
      specify { subject[:b_quant_offset].should == 0.0 }
    end

    describe 'has_b_frames' do
      specify { subject[:has_b_frames].should == 0 }
    end

    describe 'mpeg_quant' do
      specify { subject[:mpeg_quant].should == 0 }
    end

    describe 'i_quant_factor' do
      specify { subject[:i_quant_factor].should == 0.0 }
    end

    describe 'i_quant_offset' do
      specify { subject[:i_quant_offset].should == 0.0 }
    end

    describe 'lumi_masking' do
      specify { subject[:lumi_masking].should == 0.0 }
    end

    describe 'temporal_cplx_masking' do
      specify { subject[:temporal_cplx_masking].should == 0.0 }
    end

    describe 'spatial_cplx_masking' do
      specify { subject[:spatial_cplx_masking].should == 0.0 }
    end

    describe 'p_masking' do
      specify { subject[:p_masking].should == 0.0 }
    end

    describe 'dark_masking' do
      specify { subject[:dark_masking].should == 0.0 }
    end

    describe 'slice_count' do
      specify { subject[:slice_count].should == 0 }
    end

    describe 'prediction_method' do
      specify { subject[:prediction_method].should == 0 }
    end

    describe 'slice_offset' do
      specify { subject[:slice_offset].should be_a FFI::Pointer }
      specify { subject[:slice_offset].address.should == 0 }
    end

    describe 'sample_aspect_ratio' do
      specify { subject[:sample_aspect_ratio].should be_a FFI::FFmpeg::AVRational }
    end

    describe 'me_cmp' do
      specify { subject[:me_cmp].should == 0 }
    end

    describe 'me_sub_cmp' do
      specify { subject[:me_sub_cmp].should == 0 }
    end

    describe 'mb_cmp' do
      specify { subject[:mb_cmp].should == 0 }
    end

    describe 'ildct_cmp' do
      specify { subject[:ildct_cmp].should == 0 }
    end

    describe 'dia_size' do
      specify { subject[:dia_size].should == 0 }
    end

    describe 'last_predictor_count' do
      specify { subject[:last_predictor_count].should == 0 }
    end

    describe 'pre_me' do
      specify { subject[:pre_me].should == 0 }
    end

    describe 'me_pre_cmp' do
      specify { subject[:me_pre_cmp].should == 0 }
    end

    describe 'pre_dia_size' do
      specify { subject[:pre_dia_size].should == 0 }
    end

    describe 'me_subpel_quality' do
      specify { subject[:me_subpel_quality].should == 0 }
    end

    describe 'dtg_active_format' do
      specify { subject[:dtg_active_format].should == 0 }
    end

    describe 'me_range' do
      specify { subject[:me_range].should == 0 }
    end

    describe 'intra_quant_bias' do
      specify { subject[:intra_quant_bias].should == 0 }
    end

    describe 'inter_quant_bias' do
      specify { subject[:inter_quant_bias].should == 0 }
    end

    describe 'slice_flags' do
      specify { subject[:slice_flags].should == 0 }
    end

    describe 'xvmc_acceleration' do
      specify { subject[:xvmc_acceleration].should == 0 }
    end

    describe 'mb_decision' do
      specify { subject[:mb_decision].should == 0 }
    end

    describe 'intra_matrix' do
      specify { subject[:intra_matrix].should be_a FFI::Pointer }
      specify { subject[:intra_matrix].address.should == 0 }
    end

    describe 'inter_matrix' do
      specify { subject[:inter_matrix].should be_a FFI::Pointer }
      specify { subject[:inter_matrix].address.should == 0 }
    end

    describe 'scenechange_threshold' do
      specify { subject[:scenechange_threshold].should == 0 }
    end

    describe 'noise_reduction' do
      specify { subject[:noise_reduction].should == 0 }
    end

    describe 'me_threshold' do
      specify { subject[:me_threshold].should == 0 }
    end

    describe 'intra_dc_precision' do
      specify { subject[:intra_dc_precision].should == 0 }
    end

    describe 'skip_top' do
      specify { subject[:skip_top].should == 0 }
    end

    describe 'skip_bottom' do
      specify { subject[:skip_bottom].should == 0 }
    end

    describe 'border_masking' do
      specify { subject[:border_masking].should == 0.0 }
    end

    describe 'mb_lmin' do
      specify { subject[:mb_lmin].should == 0 }
    end

    describe 'mb_lmax' do
      specify { subject[:mb_lmax].should == 0 }
    end

    describe 'me_penalty_compensation' do
      specify { subject[:me_penalty_compensation].should == 0 }
    end

    describe 'bidir_refine' do
      specify { subject[:bidir_refine].should == 0 }
    end

    describe 'brd_scale' do
      specify { subject[:brd_scale].should == 0 }
    end

    describe 'keyint_min' do
      specify { subject[:keyint_min].should == 0 }
    end

    describe 'refs' do
      specify { subject[:refs].should == 0 }
    end

    describe 'chromaoffset' do
      specify { subject[:chromaoffset].should == 0 }
    end

    describe 'scenechange_factor' do
      specify { subject[:scenechange_factor].should == 0 }
    end

    describe 'mv0_threshold' do
      specify { subject[:mv0_threshold].should == 0 }
    end

    describe 'b_sensitivity' do
      specify { subject[:b_sensitivity].should == 0 }
    end

    describe 'color_primaries' do
      specify { subject[:color_primaries].should == 0 }
    end

    describe 'color_trc' do
      specify { subject[:color_trc].should == 0 }
    end

    describe 'colorspace' do
      specify { subject[:colorspace].should == :rgb }
    end

    describe 'color_range' do
      specify { subject[:color_range].should == :unspecified }
    end

    describe 'chroma_sample_location' do
      specify { subject[:chroma_sample_location].should == :unspecified }
    end

    describe 'slices' do
      specify { subject[:slices].should == 0 }
    end

    describe 'field_order' do
      specify { subject[:field_order].should == :unknown }
    end

    describe 'sample_rate' do
      specify { subject[:sample_rate].should == 0 }
    end

    describe 'channels' do
      specify { subject[:channels].should == 0 }
    end

    describe 'sample_fmt' do
      specify { subject[:sample_fmt].should == :u8 }
    end

    describe 'frame_size' do
      specify { subject[:frame_size].should == 0 }
    end

    describe 'frame_number' do
      specify { subject[:frame_number].should == 0 }
    end

    describe 'block_align' do
      specify { subject[:block_align].should == 0 }
    end

    describe 'cutoff' do
      specify { subject[:cutoff].should == 0 }
    end

    describe 'channel_layout' do
      specify { subject[:channel_layout].should == 0 }
    end

    describe 'request_channel_layout' do
      specify { subject[:request_channel_layout].should == 0 }
    end

    describe 'audio_service_type' do
      specify { subject[:audio_service_type].should == :main }
    end

    describe 'request_sample_fmt' do
      specify { subject[:request_sample_fmt].should == :u8 }
    end

    describe 'get_buffer' do
      specify { subject[:get_buffer].should be_a FFI::Pointer }
      specify { subject[:get_buffer].address.should == 0 }
    end

    describe 'release_buffer' do
      specify { subject[:release_buffer].should be_a FFI::Pointer }
      specify { subject[:release_buffer].address.should == 0 }
    end

    describe 'reget_buffer' do
      specify { subject[:reget_buffer].should be_a FFI::Pointer }
      specify { subject[:reget_buffer].address.should == 0 }
    end

    describe 'qcompress' do
      specify { subject[:qcompress].should == 0.0 }
    end

    describe 'qblur' do
      specify { subject[:qblur].should == 0.0 }
    end

    describe 'qmin' do
      specify { subject[:qmin].should == 0 }
    end

    describe 'qmax' do
      specify { subject[:qmax].should == 0 }
    end

    describe 'max_qdiff' do
      specify { subject[:max_qdiff].should == 0 }
    end

    describe 'rc_qsquish' do
      specify { subject[:rc_qsquish].should == 0.0 }
    end

    describe 'rc_qmod_amp' do
      specify { subject[:rc_qmod_amp].should == 0.0 }
    end

    describe 'rc_qmod_freq' do
      specify { subject[:rc_qmod_freq].should == 0.0 }
    end

    describe 'rc_buffer_size' do
      specify { subject[:rc_buffer_size].should == 0 }
    end

    describe 'rc_override_count' do
      specify { subject[:rc_override_count].should == 0 }
    end

    describe 'rc_override' do
      specify { subject[:rc_override].should be_a FFI::Pointer }
      specify { subject[:rc_override].address.should == 0 }
    end

    describe 'rc_eq' do
      specify { subject[:rc_eq].should be_a FFI::Pointer }
      specify { subject[:rc_eq].address.should == 0 }
    end

    describe 'rc_max_rate' do
      specify { subject[:rc_max_rate].should == 0 }
    end

    describe 'rc_min_rate' do
      specify { subject[:rc_min_rate].should == 0 }
    end

    describe 'rc_buffer_aggressivity' do
      specify { subject[:rc_buffer_aggressivity].should == 0.0 }
    end

    describe 'rc_initial_cplx' do
      specify { subject[:rc_initial_cplx].should == 0.0 }
    end

    describe 'rc_max_available_vbv_use' do
      specify { subject[:rc_max_available_vbv_use].should == 0.0 }
    end

    describe 'rc_min_vbv_overflow_use' do
      specify { subject[:rc_min_vbv_overflow_use].should == 0.0 }
    end

    describe 'rc_initial_buffer_occupancy' do
      specify { subject[:rc_initial_buffer_occupancy].should == 0 }
    end

    describe 'coder_type' do
      specify { subject[:coder_type].should == 0 }
    end

    describe 'context_model' do
      specify { subject[:context_model].should == 0 }
    end

    describe 'lmin' do
      specify { subject[:lmin].should == 0 }
    end

    describe 'lmax' do
      specify { subject[:lmax].should == 0 }
    end

    describe 'frame_skip_threshold' do
      specify { subject[:frame_skip_threshold].should == 0 }
    end

    describe 'frame_skip_factor' do
      specify { subject[:frame_skip_factor].should == 0 }
    end

    describe 'frame_skip_exp' do
      specify { subject[:frame_skip_exp].should == 0 }
    end

    describe 'frame_skip_cmp' do
      specify { subject[:frame_skip_cmp].should == 0 }
    end

    describe 'trellis' do
      specify { subject[:trellis].should == 0 }
    end

    describe 'min_prediction_order' do
      specify { subject[:min_prediction_order].should == 0 }
    end

    describe 'max_prediction_order' do
      specify { subject[:max_prediction_order].should == 0 }
    end

    describe 'timecode_frame_start' do
      specify { subject[:timecode_frame_start].should == 0 }
    end

    describe 'rtp_callback' do
      specify { subject[:rtp_callback].should be_a FFI::Pointer }
      specify { subject[:rtp_callback].address.should == 0 }
    end

    describe 'rtp_payload_size' do
      specify { subject[:rtp_payload_size].should == 0 }
    end

    describe 'mv_bits' do
      specify { subject[:mv_bits].should == 0 }
    end

    describe 'header_bits' do
      specify { subject[:header_bits].should == 0 }
    end

    describe 'i_tex_bits' do
      specify { subject[:i_tex_bits].should == 0 }
    end

    describe 'p_tex_bits' do
      specify { subject[:p_tex_bits].should == 0 }
    end

    describe 'i_count' do
      specify { subject[:i_count].should == 0 }
    end

    describe 'p_count' do
      specify { subject[:p_count].should == 0 }
    end

    describe 'skip_count' do
      specify { subject[:skip_count].should == 0 }
    end

    describe 'misc_bits' do
      specify { subject[:misc_bits].should == 0 }
    end

    describe 'frame_bits' do
      specify { subject[:frame_bits].should == 0 }
    end

    describe 'stats_out' do
      specify { subject[:stats_out].should be_a FFI::Pointer }
      specify { subject[:stats_out].address.should == 0 }
    end

    describe 'stats_in' do
      specify { subject[:stats_in].should be_a FFI::Pointer }
      specify { subject[:stats_in].address.should == 0 }
    end

    describe 'workaround_bugs' do
      specify { subject[:workaround_bugs].should == 0 }
    end

    describe 'strict_std_compliance' do
      specify { subject[:strict_std_compliance].should == 0 }
    end

    describe 'error_concealment' do
      specify { subject[:error_concealment].should == 0 }
    end

    describe 'debug' do
      specify { subject[:debug].should == 0 }
    end

    describe 'debug_mv' do
      specify { subject[:debug_mv].should == 0 }
    end

    describe 'err_recognition' do
      specify { subject[:err_recognition].should == 0 }
    end

    describe 'reordered_opaque' do
      specify { subject[:reordered_opaque].should == 0 }
    end

    describe 'hwaccel' do
      specify { subject[:hwaccel].should be_a FFI::FFmpeg::AVHWAccel }
    end

    describe 'hwaccel_context' do
      specify { subject[:hwaccel_context].should be_a FFI::Pointer }
      specify { subject[:hwaccel_context].address.should == 0 }
    end

    describe 'error' do
      specify { subject[:error].should be_a FFI::Struct::InlineArray }
      specify { subject[:error].size.should == 8 }
    end

    describe 'dct_algo' do
      specify { subject[:dct_algo].should == 0 }
    end

    describe 'idct_algo' do
      specify { subject[:idct_algo].should == 0 }
    end

    describe 'bits_per_coded_sample' do
      specify { subject[:bits_per_coded_sample].should == 0 }
    end

    describe 'bits_per_raw_sample' do
      specify { subject[:bits_per_raw_sample].should == 0 }
    end

    describe 'lowres' do
      specify { subject[:lowres].should == 0 }
    end

    describe 'coded_frame' do
      specify { subject[:coded_frame].should be_a FFI::FFmpeg::AVFrame }
    end

    describe 'thread_count' do
      specify { subject[:thread_count].should == 0 }
    end

    describe 'thread_type' do
      specify { subject[:thread_type].should == 0 }
    end

    describe 'active_thread_type' do
      specify { subject[:active_thread_type].should == 0 }
    end

    describe 'thread_safe_callbacks' do
      specify { subject[:thread_safe_callbacks].should == 0 }
    end

    describe 'execute' do
      specify { subject[:execute].should be_a FFI::Pointer }
    end

    describe 'execute2' do
      specify { subject[:execute2].should be_a FFI::Pointer }
    end

    describe 'thread_opaque' do
      specify { subject[:thread_opaque].should be_a FFI::Pointer }
    end

    describe 'nsse_weight' do
      specify { subject[:nsse_weight].should == 0 }
    end

    describe 'profile' do
      specify { subject[:profile].should == 0 }
    end

    describe 'level' do
      specify { subject[:level].should == 0 }
    end

    describe 'skip_loop_filter' do
      specify { subject[:skip_loop_filter].should == :default }
    end

    describe 'skip_idct' do
      specify { subject[:skip_idct].should == :default }
    end

    describe 'skip_frame' do
      specify { subject[:skip_frame].should == :default }
    end

    describe 'subtitle_header' do
      specify { subject[:subtitle_header].should be_a FFI::Pointer }
    end

    describe 'subtitle_header_size' do
      specify { subject[:subtitle_header_size].should == 0 }
    end

    describe 'error_rate' do
      specify { subject[:error_rate].should == 0 }
    end

    describe 'pkt' do
      specify { subject[:pkt].should be_a FFI::FFmpeg::AVPacket }
    end

    describe 'vbv_delay' do
      specify { subject[:vbv_delay].should == 0 }
    end

    describe 'pkt_timebase' do
      specify { subject[:vbv_delay].should == 0 }
    end

    describe 'codec_descriptor' do
      specify { subject[:codec_descriptor].should be_a FFI::FFmpeg::AVCodecDescriptor }
    end

    describe 'pts_correction_num_faulty_pts' do
      specify { subject[:pts_correction_num_faulty_pts].should == 0 }
    end

    describe 'pts_correction_num_faulty_dts' do
      specify { subject[:pts_correction_num_faulty_dts].should == 0 }
    end

    describe 'pts_correction_last_pts' do
      specify { subject[:pts_correction_last_pts].should == 0 }
    end

    describe 'pts_correction_num_last_dts' do
      specify { subject[:pts_correction_last_dts].should == 0 }
    end

    describe 'metadata' do
      specify { subject[:metadata].should be_a FFI::FFmpeg::AVDictionary }
    end
  end
end
