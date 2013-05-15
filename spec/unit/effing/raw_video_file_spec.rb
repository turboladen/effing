require 'spec_helper'
require 'effing/raw_video_file'


describe Effing::RawVideoFile do
  subject do
    FFI::LibC.should_receive(:fopen).with('test', 'wb').and_return file

    Effing::RawVideoFile.new('test', width, height, pixel_format)
  end

  let(:file) { double 'File' }
  let(:pixel_format) { double 'pixel format' }
  let(:width) { 4444 }
  let(:height) { 5555 }
  let(:frame) { double 'frame' }

  let(:dest_picture) do
    {
      data: double('Picture Data', :[] => frame),
      linesize: 123
    }
  end

  describe '#write' do
    let(:data) { double 'video data' }

    before do
      subject.should_receive(:init_destination_picture).
        and_return([dest_picture, 1234])
    end

    it 'uses av_image_copy() to copy the image data to a buffer' do
      FFI::FFmpeg.should_receive(:av_image_copy).with(
        dest_picture[:data],
        dest_picture[:linesize],
        data,
        333,
        pixel_format,
        width,
        height
      )

      FFI::LibC.stub(:fwrite)
      FFI::FFmpeg.stub(:av_freep)

      subject.write(data, 333)
    end

    it 'uses fwrite() to write the buffer to file' do
      FFI::FFmpeg.stub(:av_image_copy)

      FFI::LibC.should_receive(:fwrite).with(
        frame,
        1,
        1234,
        file
      )

      FFI::FFmpeg.stub(:av_freep)

      subject.write(data, 333)
    end
  end

  describe '#close' do
    it 'uses fclose() to close the file' do
      FFI::LibC.should_receive(:fclose).with(file)

      subject.close
    end
  end

  describe '#init_destination_picture' do
    context 'FFI::FFmpeg.av_image_alloc fails' do
      it 'allocates a frame and AVPicture' do
        FFI::FFmpeg.should_receive(:avcodec_alloc_frame).and_return dest_picture
        FFI::FFmpeg::AVPicture.should_receive(:new).with(dest_picture).
          and_return dest_picture
        FFI::FFmpeg.stub(:av_image_alloc).and_return -1

        expect {
          subject.send(:init_destination_picture)
        }.to raise_error RuntimeError
      end
    end

    context 'FFI::FFmpeg.av_image_alloc succeeds' do
      it 'allocates a frame and AVPicture' do
        FFI::FFmpeg.should_receive(:avcodec_alloc_frame).and_return dest_picture
        FFI::FFmpeg::AVPicture.should_receive(:new).with(dest_picture).
          and_return dest_picture
        FFI::FFmpeg.stub(:av_image_alloc).and_return 1

        subject.send(:init_destination_picture).should == [dest_picture, 1]
      end
    end
  end
end
