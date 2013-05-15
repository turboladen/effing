require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_codec'


describe FFI::FFmpeg::AVCodec do
  subject do
    FFI::FFmpeg::AVCodec.new
  end

  context 'default values' do
    describe 'name' do
      specify { subject[:name].should be_nil }
    end

    describe 'long_name' do
      specify { subject[:long_name].should be_nil }
    end

    describe 'type' do
      specify { subject[:type].should eq :video }
    end

    describe 'id' do
      specify { subject[:id].should eq :none }
    end

    describe 'capabilities' do
      specify { subject[:capabilities].should eq 0 }
      specify { subject[:capabilities].size.should be 8 }
    end

    describe 'supported_framerates' do
      specify { subject[:supported_framerates].should be_a FFI::FFmpeg::AVRational }
    end

    describe 'pix_fmts' do
      specify { subject[:pix_fmts].should be_a FFI::Pointer }
      specify { subject[:pix_fmts].address.should eq 0 }
    end

    describe 'supported_samplerates' do
      specify { subject[:supported_samplerates].should be_a FFI::Pointer }
      specify { subject[:supported_samplerates].address.should eq 0 }
    end

    describe 'sample_fmts' do
      specify { subject[:sample_fmts].should be_a FFI::Pointer }
      specify { subject[:sample_fmts].address.should eq 0 }
    end

    describe 'channel_layouts' do
      specify { subject[:channel_layouts].should be_a FFI::Pointer }
      specify { subject[:channel_layouts].address.should eq 0 }
    end

    describe 'max_lowres' do
      specify { subject[:max_lowres].should eq 0 }
      specify { subject[:max_lowres].size.should be 8 }
    end

    describe 'priv_class' do
      specify { subject[:priv_class].should be_a FFI::FFmpeg::AVClass }
    end

    describe 'profiles' do
      specify { subject[:profiles].should be_a FFI::Pointer }
      specify { subject[:profiles].address.should eq 0 }
    end

    describe 'priv_data_size' do
      specify { subject[:priv_data_size].should eq 0 }
      specify { subject[:priv_data_size].size.should be 8 }
    end

    describe 'next' do
      specify { subject[:next].should be_a FFI::FFmpeg::AVCodec }
    end

    describe 'defaults' do
      specify { subject[:defaults].should be_a FFI::Pointer }
      specify { subject[:defaults].address.should eq 0 }
    end

    describe 'init_static_data' do
      specify { subject[:init_static_data].should be_a FFI::Pointer }
      specify { subject[:init_static_data].address.should eq 0 }
    end

    describe 'encode_sub' do
      specify { subject[:encode_sub].should be_a FFI::Pointer }
      specify { subject[:encode_sub].address.should eq 0 }
    end

    describe 'encode2' do
      specify { subject[:encode2].should be_a FFI::Pointer }
      specify { subject[:encode2].address.should eq 0 }
    end

    describe 'decode' do
      specify { subject[:decode].should be_a FFI::Pointer }
      specify { subject[:decode].address.should eq 0 }
    end

    describe 'close' do
      specify { subject[:close].should be_a FFI::Pointer }
      specify { subject[:close].address.should eq 0 }
    end

    describe 'flush' do
      specify { subject[:flush].should be_a FFI::Pointer }
      specify { subject[:flush].address.should eq 0 }
    end

    describe 'init_thread_copy' do
      specify { subject[:init_thread_copy].should be_a FFI::Pointer }
      specify { subject[:init_thread_copy].address.should eq 0 }
    end

    describe 'update_thread_context' do
      specify { subject[:update_thread_context].should be_a FFI::Pointer }
      specify { subject[:update_thread_context].address.should eq 0 }
    end
  end
end
