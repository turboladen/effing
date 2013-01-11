require 'spec_helper'
require 'effing/decoder'


describe Effing::Decoder do
  let(:stream) do
    s = double "@stream"
    s.stub(:index)

    s
  end

  let(:reader) do
    r = double "Effing::FileReader"
    r.stub :dump_format

    r
  end

  subject do
    Effing::FileReader.stub(:new).and_return reader
    Effing::Decoder.new('some_file', 0)
  end

  describe "#initialize" do
    before do
      Effing::Decoder.any_instance.stub(:find_stream).and_return stream
    end

    it "creates a FileReader and finds the stream info" do
      Effing::FileReader.should_receive(:new)
      Effing::Decoder.any_instance.should_receive(:find_stream)
      Effing::Decoder.new('some_file', 0)
    end
  end

  describe "#each_frame" do
    before do
      Effing::Decoder.any_instance.stub(:find_stream)
      subject.instance_variable_set(:@stream, stream)
    end

    it "passes the block on to the #each_frome method of the stream" do
      expect { |b|
        stream.should_receive(:each_frame).with &b
        subject.each_frame(&b)
      }.to yield_control
    end
  end

  describe "#find_stream" do
    before do
      reader.stub(:streams).and_return streams
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