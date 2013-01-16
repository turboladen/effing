require 'spec_helper'
require 'effing/file_reader'
require 'fakefs/spec_helpers'


describe Effing::FileReader do
  include FakeFS::SpecHelpers

  before do
    FakeFS::FileSystem.add('some_file')
  end

  subject do
    Effing::FileReader.any_instance.stub(:open_file)
    Effing::FileReader.any_instance.stub(:find_stream_info)
    Effing::FileReader.any_instance.stub(:initialize_streams)

    Effing::FileReader.new('some_file')
  end

  describe "open_file" do
    let(:av_format_context) do
      double "FFI::MemoryPointer"
    end

    before do
      subject.should_receive(:open_file).and_call_original
      FFI::MemoryPointer.stub(:new).and_return av_format_context
    end

    context "FFmpeg.avformat_open_input returns a non-zero" do
      before do
        FFI::FFmpeg.should_receive(:avformat_open_input).and_return(-1)
      end

      it "raises a RuntimeError" do
        expect {
          subject.open_file('some_file')
        }.to raise_error RuntimeError
      end
    end

    context "FFmpeg.avformat_open_input returns zero" do
      before do
        FFI::FFmpeg.should_receive(:avformat_open_input).and_return 0
      end

      it "gets the AVFormatContext info into an instance var" do
        subject.instance_variable_get(:@av_format_context).should be_nil
        av_format_context.should_receive(:get_pointer).with 0
        FFI::FFmpeg::AVFormatContext.should_receive(:new).and_return av_format_context
        subject.open_file('some_file')
      end
    end
  end

  describe "#find_stream_info" do
    before do
      subject.should_receive(:find_stream_info).and_call_original
    end

    context "FFmpeg.av_find_stream_info returns negative value" do
      it "raises" do
        expect {
          FFI::FFmpeg.stub(:av_find_stream_info).and_return(-1)
          subject.find_stream_info
        }.to raise_error RuntimeError
      end
    end
  end

  describe "#initialize_streams" do
    let(:video_stream) do
      double "FFI::Pointer video"
    end

    let(:av_stream_video) do
      s = double "FFI::FFmpeg::AVStream video"
      s.stub_chain(:[], :[]).and_return(:video)

      s
    end

    let(:audio_stream) do
      double "FFI::Pointer audio"
    end

    let(:av_stream_audio) do
      s = double "FFI::FFmpeg::AVStream audio"
      s.stub_chain(:[], :[]).and_return(:audio)

      s
    end

    let(:streams) do
      [video_stream, audio_stream]
    end

    let(:streams_pointer) do
      a = double "FFI::Pointer"
      a.should_receive(:read_array_of_pointer).with(2).and_return(streams)

      a
    end

    let(:av_format_context) do
      {
        streams: streams_pointer,
        nb_streams: 2
      }
    end

    before do
      subject.should_receive(:initialize_streams).and_call_original
      subject.instance_variable_set(:@av_format_context, av_format_context)
    end

    it "creates a new stream for each stream in the AVFormatContext" do
      FFI::FFmpeg::AVStream.should_receive(:new).with(video_stream).
        and_return(av_stream_video)
      Effing::Streams::VideoStream.should_receive(:new).
        with(av_stream_video, av_format_context).and_return("a video stream")

      FFI::FFmpeg::AVStream.should_receive(:new).with(audio_stream).
        and_return(av_stream_audio)
      Effing::Streams::AudioStream.should_receive(:new).
        with(av_stream_audio, av_format_context).and_return("an audio stream")

      subject.send(:initialize_streams)
      subject.instance_variable_get(:@streams).size.should == 2
    end
  end
end
