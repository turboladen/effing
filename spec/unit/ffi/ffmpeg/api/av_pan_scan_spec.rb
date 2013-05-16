require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_pan_scan'


describe FFI::FFmpeg::AVPanScan do
  context 'defaults' do
    describe 'id' do
      specify { subject[:id].should == 0 }
    end

    describe 'width' do
      specify { subject[:width].should == 0 }
    end

    describe 'height' do
      specify { subject[:height].should == 0 }
    end

    describe 'position' do
      specify { subject[:position].should be_a FFI::Struct::InlineArray }
      specify { subject[:position].size.should == 3 }
    end
  end
end
