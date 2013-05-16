require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_hw_accel'


describe FFI::FFmpeg::AVHWAccel do
  context 'defaults' do
    describe 'name' do
      specify { subject[:name].should be_nil }
    end

    describe 'type' do
      specify { subject[:type].should == :video }
    end

    describe 'id' do
      specify { subject[:id].should == :none }
    end

    describe 'pxl_fmt' do
      specify { subject[:pxl_fmt].should == :yuv420p }
    end

    describe 'capabilities' do
      specify { subject[:capabilities].should == 0 }
    end

    describe 'next' do
      specify { subject[:next].should be_a FFI::FFmpeg::AVHWAccel }
    end

    describe 'start_frame' do
      specify { subject[:start_frame].should be_a FFI::Pointer }
      specify { subject[:start_frame].address.should == 0 }
    end

    describe 'decode_slice' do
      specify { subject[:decode_slice].should be_a FFI::Pointer }
      specify { subject[:decode_slice].address.should == 0 }
    end

    describe 'end_frame' do
      specify { subject[:end_frame].should be_a FFI::Pointer }
      specify { subject[:end_frame].address.should == 0 }
    end

    describe 'priv_data_size' do
      specify { subject[:priv_data_size].should == 0 }
    end
  end
end
