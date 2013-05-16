require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_frame'


describe FFI::FFmpeg::AVFrame do
  describe 'data' do
    specify { subject[:data].should be_a FFI::Struct::InlineArray }
    specify { subject[:data].size.should == 8 }
  end

  describe 'linesize' do
    specify { subject[:linesize].should be_a FFI::Struct::InlineArray }
    specify { subject[:linesize].size.should == 8 }
  end

  describe 'extended_data' do
    specify { subject[:extended_data].should be_a FFI::Pointer }
    specify { subject[:extended_data].address.should == 0 }
  end

  describe 'width' do
    specify { subject[:width].should == 0 }
  end

  describe 'height' do
    specify { subject[:height].should == 0 }
  end

  describe 'nb_samples' do
    specify { subject[:nb_samples].should == 0 }
  end

  describe 'format' do
    specify { subject[:format].should == 0 }
  end

  describe 'key_frame' do
    specify { subject[:key_frame].should == 0 }
  end

  describe 'pict_type' do
    specify { subject[:pict_type].should == :none }
  end

  describe 'base' do
    specify { subject[:base].should be_a FFI::Struct::InlineArray }
    specify { subject[:base].size.should == 8 }
  end

  describe 'sample_aspect_ratio' do
    specify { subject[:sample_aspect_ratio].should be_a FFI::FFmpeg::AVRational }
  end

  describe 'pts' do
    specify { subject[:pts].should == 0 }
  end

  describe 'pkt_pts' do
    specify { subject[:pkt_pts].should == 0 }
  end

  describe 'pkt_dts' do
    specify { subject[:pkt_dts].should == 0 }
  end

  describe 'coded_picture_number' do
    specify { subject[:coded_picture_number].should == 0 }
  end

  describe 'quality' do
    specify { subject[:quality].should == 0 }
  end

  describe 'reference' do
    specify { subject[:reference].should == 0 }
  end

  describe 'qscale_table' do
    specify { subject[:qscale_table].should be_a FFI::Pointer }
    specify { subject[:qscale_table].address.should == 0 }
  end

  describe 'qstride' do
    specify { subject[:qstride].should == 0 }
  end

  describe 'qscale_type' do
    specify { subject[:qscale_type].should == 0 }
  end

  describe 'mbskip_table' do
    specify { subject[:mbskip_table].should be_a FFI::Pointer }
    specify { subject[:mbskip_table].address.should == 0 }
  end

  describe 'motion_val' do
    specify { subject[:motion_val].should be_a FFI::Struct::InlineArray }
    specify { subject[:motion_val].size.should == 2 }
  end

  describe 'mb_type' do
    specify { subject[:mb_type].should be_a FFI::Pointer }
    specify { subject[:mb_type].address.should == 0 }
  end

  describe 'dct_coeff' do
    specify { subject[:dct_coeff].should be_a FFI::Pointer }
    specify { subject[:dct_coeff].address.should == 0 }
  end

  describe 'ref_index' do
    specify { subject[:ref_index].should be_a FFI::Struct::InlineArray }
    specify { subject[:ref_index].size.should == 2 }
  end

  describe 'opaque' do
    specify { subject[:opaque].should be_a FFI::Pointer }
    specify { subject[:opaque].address.should == 0 }
  end

  describe 'error' do
    specify { subject[:error].should be_a FFI::Struct::InlineArray }
    specify { subject[:error].size.should == 8 }
  end

  describe 'type' do
    specify { subject[:type].should == 0 }
  end

  describe 'repeat_pict' do
    specify { subject[:repeat_pict].should == 0 }
  end

  describe 'interlaced_frame' do
    specify { subject[:interlaced_frame].should == 0 }
  end

  describe 'top_field_first' do
    specify { subject[:top_field_first].should == 0 }
  end

  describe 'palette_has_changed' do
    specify { subject[:palette_has_changed].should == 0 }
  end

  describe 'buffer_hints' do
    specify { subject[:buffer_hints].should == 0 }
  end

  describe 'pan_scan' do
    specify { subject[:pan_scan].should be_a FFI::FFmpeg::AVPanScan }
  end

  describe 'reordered_opaque' do
    specify { subject[:reordered_opaque].should == 0 }
  end

  describe 'hwaccel_picture_private' do
    specify { subject[:hwaccel_picture_private].should be_a FFI::Pointer }
    specify { subject[:hwaccel_picture_private].address.should == 0 }
  end

  describe 'owner' do
    specify { subject[:owner].should be_a FFI::Pointer }
    specify { subject[:owner].address.should == 0 }
  end

  describe 'thread_opaque' do
    specify { subject[:thread_opaque].should be_a FFI::Pointer }
    specify { subject[:thread_opaque].address.should == 0 }
  end

  describe 'motion_subsample_log2' do
    specify { subject[:motion_subsample_log2].should == 0 }
  end

  describe 'sample_rate' do
    specify { subject[:sample_rate].should == 0 }
  end

  describe 'channel_layout' do
    specify { subject[:channel_layout].should == 0 }
  end

  describe 'best_effort_timestamp' do
    specify { subject[:best_effort_timestamp].should == 0 }
  end

  describe 'pkt_pos' do
    specify { subject[:pkt_pos].should == 0 }
  end

  describe 'pkt_duration' do
    specify { subject[:pkt_duration].should == 0 }
  end

  describe 'metadata' do
    specify { subject[:metadata].should be_a FFI::FFmpeg::AVDictionary }
  end

  describe 'decode_error_flags' do
    specify { subject[:decode_error_flags].should == 0 }
  end

  describe 'channels' do
    specify { subject[:channels].should == 0 }
  end

  describe 'pkt_size' do
    specify { subject[:pkt_size].should == 0 }
  end

  describe '#to_hash' do
    it 'returns a Hash with struct attributes keys and values' do
      subject.to_hash.should_not be_empty
    end
  end
end
