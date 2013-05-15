require 'spec_helper'
require 'effing/streams/video_stream'


describe Effing::Streams::VideoStream do
  let(:codec) { double 'FFI::Pointer codec', to_i: 0 }

  let(:av_codec_context) do
    c = double 'AVCodecContext'
    c.should_receive(:[]).with(:width).and_return(444)
    c.should_receive(:[]).with(:height).and_return(555)
    c.should_receive(:[]).with(:pix_fmt).and_return(666)
    c.should_receive(:[]).with(:codec_id).and_return(777)

    c
  end

  let(:av_stream) do
    s = double 'FFI::FFmpeg::AVStream'
    s.stub(:[]).and_return(av_codec_context)

    s
  end

  let(:av_format_context) { double 'FFI::FFmpeg::AVFormatContext' }

  subject do
    Effing::Streams::VideoStream.any_instance.stub(:find_decoder)
    Effing::Streams::VideoStream.any_instance.stub(:open_codec)

    Effing::Streams::VideoStream.new(av_stream, av_format_context)
  end

  describe '#initialize' do
    it 'creates a new VideoFrame to use as a buffer' do
      Effing::Frames::VideoFrame.should_receive(:new).with(444, 555, 666)

      subject
    end
  end

  describe '#decode_frame' do
    let(:av_frame) { double 'AVFrame' }
    let(:packet) { double 'packet' }
    let(:frame_finished) { double 'FFI::MemoryPointer' }

    let(:raw_frame) do
      rf = double 'raw video frame'
      rf.stub(:av_frame).and_return av_frame

      rf
    end

    context 'frame is empty' do
      before do
        subject.instance_variable_set(:@raw_frame, raw_frame)
        subject.instance_variable_set(:@frame_finished, frame_finished)

        subject.should_receive(:avcodec_decode_video2).with(
          av_codec_context,
          av_frame,
          frame_finished,
          packet
        ).and_return 0
      end

      context 'not done reading the frame' do
        before do
          frame_finished.should_receive(:read_int).and_return 1
        end

        it 'decodes the frame and reads it into @raw_frame' do
          av_frame.should_receive(:[]).with(:coded_picture_number)
          av_frame.should_receive(:[]).with(:pts)
          av_frame.should_receive(:[]).with(:pkt_dts)

          subject.decode_frame(packet)
        end
      end

      context 'done reading the frame' do
        before do
          frame_finished.should_receive(:read_int).at_least(:once).and_return -1
        end

        it 'does not return a frame' do
          av_frame.should_not_receive(:[]).with(:coded_picture_number)
          av_frame.should_not_receive(:[]).with(:pts)
          av_frame.should_not_receive(:[]).with(:pkt_dts)

          subject.decode_frame(packet).should be_nil
        end
      end
    end
  end
end
