require 'spec_helper'
require 'effing/streams/base_stream'


describe Effing::Streams::BaseStream do
  let(:codec) { double 'FFI::Pointer codec', to_i: 0 }

  let(:av_codec_context) do
    c = double 'AVCodecContext'
    c.stub(:[]).and_return(codec)

    c
  end

  let(:av_stream) do
    s = double 'FFI::FFmpeg::AVStream'
    s.stub(:[]).and_return(av_codec_context)

    s
  end

  let(:av_format_context) { double 'FFI::FFmpeg::AVFormatContext' }

  subject do
    Effing::Streams::BaseStream.new(av_stream, av_format_context)
  end

  before do
    Effing::Streams::BaseStream.any_instance.stub(:find_decoder).
      and_return(codec)
    Effing::Streams::BaseStream.any_instance.stub(:open_codec)
  end

  describe '#open_codec' do
    before do
      Effing::Streams::BaseStream.any_instance.stub(:find_decoder).
        and_return(codec)
      subject.instance_variable_set(:@av_codec_context, av_codec_context)
      subject.should_receive(:open_codec).and_call_original
    end

    context 'could not open the codec' do
      before do
        codec.stub(:to_i).and_return(-1)
        FFI::FFmpeg.stub(:old_api?).and_return(false)
        FFI::FFmpeg.stub(:avcodec_open2).with(av_codec_context, codec, nil).
          and_return(codec)
      end

      it 'raises a RuntimeError' do
        expect {
          subject.open_codec(codec)
        }.to raise_error RuntimeError
      end
    end

    context 'old api' do
      before do
        FFI::FFmpeg.stub(:old_api?).and_return(true)
      end

      pending 'Testing the old API'
    end

    context 'new api' do
      before do
        FFI::FFmpeg.stub(:old_api?).and_return(false)
      end

      it 'uses FFI::FFmpeg.avcodec_open2 to open the codec with options' do
        FFI::FFmpeg.should_receive(:avcodec_open2).
          with(av_codec_context, codec, nil).and_return(codec)
        subject.open_codec(codec)
      end
    end
  end

  describe '#find_decoder' do
    before do
      subject.should_receive(:find_decoder).and_call_original
    end

    context 'no decoder found' do
      before do
        codec.stub(:null?)
        FFI::FFmpeg.stub(:avcodec_find_decoder).and_return nil
      end

      it 'raises a RuntimeError' do
        expect {
          subject.find_decoder(:bobo_the_deocder)
        }.to raise_error RuntimeError
      end
    end
  end
end
