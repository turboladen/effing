require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_probe_data'


describe FFI::FFmpeg::AVProbeData do
  context 'defaults' do
    describe 'filename' do
      specify { subject[:filename].should be_nil }
    end

    describe 'buf' do
      specify { subject[:buf].should be_a FFI::Pointer }
      specify { subject[:buf].address.should == 0 }
    end

    describe 'buf_size' do
      specify { subject[:buf_size].should == 0 }
    end
  end
end
