require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_codec_parser'


describe FFI::FFmpeg::AVCodecParser do
  context 'default values' do
    describe 'codec_ids' do
      specify { subject[:codec_ids].should be_a FFI::Struct::InlineArray }
      specify { subject[:codec_ids].size.should == 5 }
    end

    describe 'priv_data_size' do
      specify { subject[:priv_data_size].should == 0 }
    end

    describe 'parser_init' do
      specify { subject[:parser_init].should be_a FFI::Pointer }
      specify { subject[:parser_init].address.should == 0 }
    end

    describe 'parser_parse' do
      specify { subject[:parser_parse].should be_a FFI::Pointer }
      specify { subject[:parser_parse].address.should == 0 }
    end

    describe 'parser_close' do
      specify { subject[:parser_close].should be_a FFI::Pointer }
      specify { subject[:parser_close].address.should == 0 }
    end

    describe 'split' do
      specify { subject[:split].should be_a FFI::Pointer }
      specify { subject[:split].address.should == 0 }
    end

    describe 'next' do
      specify { subject[:next].should be_a FFI::FFmpeg::AVCodecParser }
    end
  end
end
