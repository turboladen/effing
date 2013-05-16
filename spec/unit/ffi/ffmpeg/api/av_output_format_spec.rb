require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_output_format'


describe FFI::FFmpeg::AVOutputFormat do
  context 'defaults' do
    describe 'name' do
      specify { subject[:name].should be_nil }
    end

    describe 'long_name' do
      specify { subject[:long_name].should be_nil }
    end

    describe 'mime_type' do
      specify { subject[:mime_type].should be_nil }
    end

    describe 'extensions' do
      specify { subject[:extensions].should be_nil }
    end

    describe 'audio_codec' do
      specify { subject[:audio_codec].should == :none }
    end

    describe 'video_codec' do
      specify { subject[:video_codec].should == :none }
    end

    describe 'subtitle_codec' do
      specify { subject[:subtitle_codec].should == :none }
    end

    describe 'flags' do
      specify { subject[:flags].should == 0 }
    end

    describe 'codec_tag' do
      specify { subject[:codec_tag].should be_a FFI::FFmpeg::AVCodecTag }
    end

    describe 'priv_class' do
      specify { subject[:priv_class].should be_a FFI::FFmpeg::AVClass }
    end

    describe 'next' do
      specify { subject[:next].should be_a FFI::FFmpeg::AVOutputFormat }
    end

    describe 'priv_data_size' do
      specify { subject[:priv_data_size].should == 0 }
    end

    describe 'write_header' do
      specify { subject[:write_header].should be_a FFI::Pointer }
      specify { subject[:write_header].address.should == 0 }
    end

    describe 'write_packet' do
      specify { subject[:write_packet].should be_a FFI::Pointer }
      specify { subject[:write_packet].address.should == 0 }
    end

    describe 'write_trailer' do
      specify { subject[:write_trailer].should be_a FFI::Pointer }
      specify { subject[:write_trailer].address.should == 0 }
    end

    describe 'interleave_packet' do
      specify { subject[:interleave_packet].should be_a FFI::Pointer }
      specify { subject[:interleave_packet].address.should == 0 }
    end

    describe 'query_codec' do
      specify { subject[:query_codec].should be_a FFI::Pointer }
      specify { subject[:query_codec].address.should == 0 }
    end
  end
end
