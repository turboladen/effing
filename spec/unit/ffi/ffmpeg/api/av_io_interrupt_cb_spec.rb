require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_io_interrupt_cb'


describe FFI::FFmpeg::AVIOInterruptCB do
  context 'defaults' do
    describe 'callback' do
      specify { subject[:callback].should be_a FFI::Pointer }
      specify { subject[:callback].address.should == 0 }
    end

    describe 'opaque' do
      specify { subject[:opaque].should be_a FFI::Pointer }
      specify { subject[:opaque].address.should == 0 }
    end
  end
end
