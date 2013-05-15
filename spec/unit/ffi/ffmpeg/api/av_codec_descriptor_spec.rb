require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_codec_descriptor'


describe FFI::FFmpeg::AVCodecDescriptor do
  context 'default values' do
    describe 'id' do
      specify { subject[:id].should == :none }
    end

    describe 'type' do
      specify { subject[:type].should == :video }
    end

    describe 'name' do
      specify { subject[:name].should be_nil }
    end

    describe 'long_name' do
      specify { subject[:long_name].should be_nil }
    end

    describe 'props' do
      specify { subject[:props].should == 0 }
    end
  end
end
