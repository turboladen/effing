require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_codec_default'


describe FFI::FFmpeg::AVCodecDefault do
  context 'default values' do
    describe 'key' do
      specify { subject[:key].should be_a FFI::Pointer }
    end

    describe 'value' do
      specify { subject[:value].should be_a FFI::Pointer }
    end
  end
end
