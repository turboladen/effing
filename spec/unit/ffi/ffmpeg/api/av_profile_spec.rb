require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_profile'


describe FFI::FFmpeg::AVProfile do
  context 'defaults' do
    describe 'profile' do
      specify { subject[:profile].should == 0 }
    end

    describe 'name' do
      specify { subject[:name].should be_nil }
    end
  end
end
