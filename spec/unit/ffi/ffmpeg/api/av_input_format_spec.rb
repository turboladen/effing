require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_input_format'


describe FFI::FFmpeg::AVInputFormat do
  context 'defaults' do
    describe 'name' do
      specify { subject[:name].should be_nil }
    end

    describe 'long_name' do
      specify { subject[:long_name].should be_nil }
    end

    describe 'flags' do
      specify { subject[:flags].should == 0 }
    end

    describe 'extensions' do
      specify { subject[:extensions].should be_nil }
    end

    describe 'codec_tag' do
      specify { subject[:codec_tag].should be_a FFI::FFmpeg::AVCodecTag }
    end

    describe 'priv_class' do
      specify { subject[:priv_class].should be_a FFI::FFmpeg::AVClass }
    end

    describe 'next' do
      specify { subject[:next].should be_a FFI::FFmpeg::AVInputFormat }
    end

    describe 'raw_codec_id' do
      specify { subject[:raw_codec_id].should == 0 }
    end

    describe 'priv_data_size' do
      specify { subject[:priv_data_size].should == 0 }
    end

    describe 'read_probe' do
      specify { subject[:read_probe].should be_a FFI::Pointer }
      specify { subject[:read_probe].address.should == 0 }
    end

    describe 'read_header' do
      specify { subject[:read_header].should be_a FFI::Pointer }
      specify { subject[:read_header].address.should == 0 }
    end

    describe 'read_packet' do
      specify { subject[:read_packet].should be_a FFI::Pointer }
      specify { subject[:read_packet].address.should == 0 }
    end

    describe 'read_close' do
      specify { subject[:read_close].should be_a FFI::Pointer }
      specify { subject[:read_close].address.should == 0 }
    end

    describe 'read_seek' do
      specify { subject[:read_seek].should be_a FFI::Pointer }
      specify { subject[:read_seek].address.should == 0 }
    end

    describe 'read_timestamp' do
      specify { subject[:read_timestamp].should be_a FFI::Pointer }
      specify { subject[:read_timestamp].address.should == 0 }
    end

    describe 'read_play' do
      specify { subject[:read_play].should be_a FFI::Pointer }
      specify { subject[:read_play].address.should == 0 }
    end

    describe 'read_pause' do
      specify { subject[:read_pause].should be_a FFI::Pointer }
      specify { subject[:read_pause].address.should == 0 }
    end

    describe 'read_seek2' do
      specify { subject[:read_seek2].should be_a FFI::Pointer }
      specify { subject[:read_seek2].address.should == 0 }
    end
  end
end
