require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_picture'


describe FFI::FFmpeg::AVPicture do
  context 'defaults' do
    describe 'data' do
      specify { subject[:data].should be_a FFI::Struct::InlineArray }
      specify { subject[:data].size.should == 8 }
    end

    describe 'linesize' do
      specify { subject[:linesize].should be_a FFI::Struct::InlineArray }
      specify { subject[:linesize].size.should == 8 }
    end
  end
end
