require 'spec_helper'
require 'effing/stream_reader'


describe Effing::StreamReader do
  let(:stream) do
    s = double "@stream"
    s.stub(:index)

    s
  end

  let(:file_reader) do
    r = double "Effing::FileReader"
    r.stub :dump_format

    r
  end

  subject do
    Effing::FileReader.stub(:new).and_return file_reader
    Effing::StreamReader.new('some_file', 0)
  end

  describe "#initialize" do
    before do
      Effing::StreamReader.any_instance.stub(:find_stream).and_return stream
    end

    it "creates a FileReader and finds the stream info" do
      Effing::FileReader.should_receive(:new)
      Effing::StreamReader.any_instance.should_receive(:find_stream)
      Effing::StreamReader.new('some_file', 0)
    end
  end

  describe "#decode" do
    before do
      Effing::StreamReader.any_instance.stub(:find_stream)
      subject.instance_variable_set(:@stream, stream)
    end

    it "passes the block on to the #each_frome method of the stream" do
      expect { |b|
        stream.should_receive(:each_frame).with(&b)
        subject.decode(&b)
      }.to yield_control
    end
  end

  describe "#demux" do
    before do
      Effing::StreamReader.any_instance.stub(:find_stream)
      subject.instance_variable_set(:@stream, stream)
    end

    it "passes the block on to the #each_packet method of the stream" do
      expect { |b|
        stream.should_receive(:each_packet).with(&b)
        subject.demux(&b)
      }.to yield_control
    end
  end

  describe "#find_stream" do
    before do
      file_reader.stub(:streams).and_return streams
    end

    context "the param is a Symbol" do
      let(:streams) do
        stream.stub(:type).and_return :video

        [stream]
      end

      context "the stream exists" do
        it "returns the stream object" do
          subject.send(:find_stream, :video).should == streams.first
        end
      end

      context "the stream does not exist" do
        it "returns nil" do
          subject.send(:find_stream, :audio).should be_nil
        end
      end
    end

    context "the param is a Fixnum" do
      let(:streams) do
        stream.stub(:index).and_return 0

        [stream]
      end

      context "the stream exists" do
        it "returns the stream object" do
          subject.send(:find_stream, 0).should == streams.first
        end
      end

      context "the stream does not exist" do
        it "returns nil" do
          subject.send(:find_stream, 1).should be_nil
        end
      end
    end
  end
end
