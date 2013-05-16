require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_stream'


describe FFI::FFmpeg::Info do
  context 'defaults' do
    describe 'last_dts' do
      specify { subject[:last_dts].should == 0 }
    end

    describe 'duration_gcd' do
      specify { subject[:duration_gcd].should == 0 }
    end

    describe 'duration_count' do
      specify { subject[:duration_count].should == 0 }
    end

    describe 'duration_error' do
      specify { subject[:duration_error].should == 0 }
    end

    describe 'codec_info_duration' do
      specify { subject[:codec_info_duration].should == 0 }
    end

    describe 'codec_info_duration_fields' do
      specify { subject[:codec_info_duration_fields].should == 0 }
    end

    describe 'found_decoder' do
      specify { subject[:found_decoder].should == 0 }
    end

    describe 'fps_first_dts' do
      specify { subject[:fps_first_dts].should == 0 }
    end

    describe 'fps_first_dts_idx' do
      specify { subject[:fps_first_dts_idx].should == 0 }
    end

    describe 'fps_last_dts' do
      specify { subject[:fps_last_dts].should == 0 }
    end

    describe 'fps_last_dts_idx' do
      specify { subject[:fps_last_dts_idx].should == 0 }
    end
  end
end

describe FFI::FFmpeg::AVStream do
  context 'defaults' do
    describe 'index' do
      specify { subject[:index].should == 0 }
    end

    describe 'id' do
      specify { subject[:id].should == 0 }
    end

    describe 'codec' do
      specify { subject[:codec].should be_a FFI::FFmpeg::AVCodecContext }
    end

    describe 'priv_data' do
      specify { subject[:priv_data].should be_a FFI::Pointer }
      specify { subject[:priv_data].address.should == 0 }
    end

    describe 'pts' do
      specify { subject[:pts].should be_a FFI::FFmpeg::AVFrac }
    end

    describe 'time_base' do
      specify { subject[:time_base].should be_a FFI::FFmpeg::AVRational }
    end

    describe 'start_time' do
      specify { subject[:start_time].should == 0 }
    end

    describe 'duration' do
      specify { subject[:duration].should == 0 }
    end

    describe 'nb_frames' do
      specify { subject[:nb_frames].should == 0 }
    end

    describe 'disposition' do
      specify { subject[:disposition].should == 0 }
    end

    describe 'discard' do
      specify { subject[:discard].should == :default }
    end

    describe 'sample_aspect_ratio' do
      specify { subject[:sample_aspect_ratio].should be_a FFI::FFmpeg::AVRational }
    end

    describe 'metadata' do
      specify { subject[:metadata].should be_a FFI::FFmpeg::AVDictionary }
    end

    describe 'avg_frame_rate' do
      specify { subject[:avg_frame_rate].should be_a FFI::FFmpeg::AVRational }
    end

    describe 'attached_pic' do
      specify { subject[:attached_pic].should be_a FFI::FFmpeg::AVPacket }
    end

    describe 'info' do
      specify { subject[:info].should be_a FFI::FFmpeg::Info }
    end

    describe 'pts_wrap_bits' do
      specify { subject[:pts_wrap_bits].should == 0 }
    end

    describe 'reference_dts' do
      specify { subject[:reference_dts].should == 0 }
    end

    describe 'first_dts' do
      specify { subject[:first_dts].should == 0 }
    end

    describe 'cur_dts' do
      specify { subject[:cur_dts].should == 0 }
    end

    describe 'last_IP_pts' do
      specify { subject[:last_IP_pts].should == 0 }
    end

    describe 'last_IP_duration' do
      specify { subject[:last_IP_duration].should == 0 }
    end

    describe 'probe_packets' do
      specify { subject[:probe_packets].should == 0 }
    end

    describe 'codec_info_nb_frames' do
      specify { subject[:codec_info_nb_frames].should == 0 }
    end

    describe 'stream_identifier' do
      specify { subject[:stream_identifier].should == 0 }
    end

    describe 'interleaver_chunk_size' do
      specify { subject[:interleaver_chunk_size].should == 0 }
    end

    describe 'need_parsing' do
      specify { subject[:need_parsing].should == :none }
    end

    describe 'parser' do
      specify { subject[:parser].should be_a FFI::FFmpeg::AVCodecParserContext }
    end

    describe 'last_in_packet_buffer' do
      specify { subject[:last_in_packet_buffer].should be_a FFI::FFmpeg::AVPacketList }
    end

    describe 'probe_data' do
      specify { subject[:probe_data].should be_a FFI::FFmpeg::AVProbeData }
    end

    describe 'pts_buffer' do
      specify { subject[:pts_buffer].should be_a FFI::Struct::InlineArray }
      specify { subject[:pts_buffer].size.should == 17 }
    end

    describe 'index_entries' do
      specify { subject[:index_entries].should be_a FFI::FFmpeg::AVIndexEntry }
    end

    describe 'nb_index_entries' do
      specify { subject[:nb_index_entries].should == 0 }
    end

    describe 'index_entries_allocated_size' do
      specify { subject[:index_entries_allocated_size].should == 0 }
    end

    describe 'request_probe' do
      specify { subject[:request_probe].should == 0 }
    end

    describe 'skip_to_keyframe' do
      specify { subject[:skip_to_keyframe].should == 0 }
    end

    describe 'skip_samples' do
      specify { subject[:skip_samples].should == 0 }
    end

    describe 'nb_decoded_frames' do
      specify { subject[:nb_decoded_frames].should == 0 }
    end

    describe 'mux_ts_offset' do
      specify { subject[:mux_ts_offset].should == 0 }
    end
  end

  describe '#to_s' do
    before do
      #subject.should_receive(:[]).with(:codec).and_return codec
    end

    let(:codec) do
      c = double 'codec'
      c.should_receive(:[]).with(:codec_type).and_return :video

      c
    end

    it 'returns a formatted version of the struct' do
      pending 'Figuring out how to stub the codec_type'

      subject.to_s.should match(
        %r[#<FFI::FFmpeg::AVStream:0x\w{8} index=0, id=0, codec_type=:video>]
      )
    end
  end

  describe '#to_hash' do
    it 'converts struct attributes to key/value pairs' do
      subject.to_hash.should_not be_empty
    end
  end

  describe '#discard' do
    context 'type is an Int' do
      it 'sets the value to discard' do
        subject.discard = 8
        subject[:discard].should == :nonref
      end
    end

    context 'type is an Symbol' do
      it 'sets the value to discard' do
        subject.discard = :nonref
        subject[:discard].should == :nonref
      end
    end
  end
end
