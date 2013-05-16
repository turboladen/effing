require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_packet'


describe FFI::FFmpeg::SideData do
  context 'defaults' do
    describe 'data' do
      specify { subject[:data].should be_a FFI::Pointer }
      specify { subject[:data].address.should == 0 }
    end

    describe 'size' do
      specify { subject[:size].should == 0 }
    end

    describe 'type' do
      specify { subject[:type].should == :palette }
    end
  end
end


describe FFI::FFmpeg::AVPacket do
  context 'defaults' do
    describe 'pts' do
      specify { subject[:pts].should == 0 }
    end

    describe 'dts' do
      specify { subject[:dts].should == 0 }
    end

    describe 'data' do
      specify { subject[:data].should be_a FFI::Pointer }
      specify { subject[:data].address.should == 0 }
    end

    describe 'size' do
      specify { subject[:size].should == 0 }
    end

    describe 'stream_index' do
      specify { subject[:stream_index].should == 0 }
    end

    describe 'flags' do
      specify { subject[:flags].should == 0 }
    end

    describe 'side_data' do
      specify { subject[:side_data].should be_a FFI::FFmpeg::SideData }
    end

    describe 'side_data_elems' do
      specify { subject[:side_data_elems].should == 0 }
    end

    describe 'duration' do
      specify { subject[:duration].should == 0 }
    end

    describe 'destruct' do
      specify { subject[:destruct].should be_a FFI::Pointer }
      specify { subject[:destruct].address.should == 0 }
    end

    describe 'priv' do
      specify { subject[:priv].should be_a FFI::Pointer }
      specify { subject[:priv].address.should == 0 }
    end

    describe 'pos' do
      specify { subject[:pos].should == 0 }
    end

    describe 'convergence_duration' do
      specify { subject[:convergence_duration].should == 0 }
    end
  end
end
