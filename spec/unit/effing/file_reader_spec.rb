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

end