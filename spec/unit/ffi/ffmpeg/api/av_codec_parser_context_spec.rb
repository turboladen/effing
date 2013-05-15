require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_codec_parser_context'


describe FFI::FFmpeg::AVCodecParserContext do
  context 'default' do
    describe 'priv_data' do
      specify { subject[:priv_data].should be_a FFI::Pointer }
      specify { subject[:priv_data].address.should == 0 }
    end

    describe 'parser' do
      specify { subject[:parser].should be_a FFI::FFmpeg::AVCodecParser }
    end

    describe 'frame_offset' do
      specify { subject[:frame_offset].should == 0 }
    end

    describe 'cur_offset' do
      specify { subject[:cur_offset].should == 0 }
    end

    describe 'next_frame_offset' do
      specify { subject[:next_frame_offset].should == 0 }
    end

    describe 'pict_type' do
      specify { subject[:pict_type].should == 0 }
    end

    describe 'repeat_pict' do
      specify { subject[:repeat_pict].should == 0 }
    end

    describe 'pts' do
      specify { subject[:pts].should == 0 }
    end

    describe 'dts' do
      specify { subject[:dts].should == 0 }
    end

    describe 'last_pts' do
      specify { subject[:last_pts].should == 0 }
    end

    describe 'last_dts' do
      specify { subject[:last_dts].should == 0 }
    end

    describe 'fetch_timestamp' do
      specify { subject[:fetch_timestamp].should == 0 }
    end

    describe 'cur_frame_start_index' do
      specify { subject[:cur_frame_start_index].should == 0 }
    end

    describe 'cur_frame_offset' do
      specify { subject[:cur_frame_offset].should be_a FFI::Struct::InlineArray }
      specify { subject[:cur_frame_offset].size.should == 4 }
    end

    describe 'cur_frame_pts' do
      specify { subject[:cur_frame_pts].should be_a FFI::Struct::InlineArray }
      specify { subject[:cur_frame_pts].size.should == 4 }
    end

    describe 'cur_frame_dts' do
      specify { subject[:cur_frame_dts].should be_a FFI::Struct::InlineArray }
      specify { subject[:cur_frame_dts].size.should == 4 }
    end

    describe 'flags' do
      specify { subject[:flags].should == 0 }
    end

    describe 'offset' do
      specify { subject[:offset].should == 0 }
    end

    describe 'cur_frame_end' do
      specify { subject[:cur_frame_end].should be_a FFI::Struct::InlineArray }
      specify { subject[:cur_frame_end].size.should == 4 }
    end

    describe 'key_frame' do
      specify { subject[:key_frame].should == 0 }
    end

    describe 'convergence_duration' do
      specify { subject[:convergence_duration].should == 0 }
    end

    describe 'dts_sync_point' do
      specify { subject[:dts_sync_point].should == 0 }
    end

    describe 'dts_ref_dts_delta' do
      specify { subject[:dts_ref_dts_delta].should == 0 }
    end

    describe 'pts_dts_delta' do
      specify { subject[:pts_dts_delta].should == 0 }
    end

    describe 'cur_frame_pos' do
      specify { subject[:cur_frame_pos].should be_a FFI::Struct::InlineArray }
      specify { subject[:cur_frame_pos].size.should == 4 }
    end

    describe 'pos' do
      specify { subject[:pos].should == 0 }
    end

    describe 'last_pos' do
      specify { subject[:last_pos].should == 0 }
    end

    describe 'duration' do
      specify { subject[:duration].should == 0 }
    end
  end
end
