require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_codec_tag'


describe FFI::FFmpeg::AVCodecTag do
  context 'defaults' do
    describe 'id' do
      specify { subject[:id].should == :none }
    end

    describe 'tag' do
      specify { subject[:tag].should == 0 }
    end
  end
end
