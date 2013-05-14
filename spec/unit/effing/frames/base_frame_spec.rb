require 'spec_helper'
require 'effing/frames/base_frame'


describe Effing::Frames::BaseFrame do
  describe '#initialize' do
    it 'inits the AVFrame and defines the finalizer method' do
      Effing::Frames::BaseFrame.any_instance.should_receive(:init_frame)
      ObjectSpace.should_receive(:define_finalizer)

      Effing::Frames::BaseFrame.new
    end
  end

  describe '#key_frame?' do
    let(:av_frame) do
      { key_frame: 1 }
    end

    before do
      subject.instance_variable_set(:@av_frame, av_frame)
    end

    it 'returns true if the AVFrame has :key_frame set to 1' do
      subject.key_frame?.should be_true
    end
  end

  describe '#init_frame' do
    before do
      subject.should_receive(:init_frame).and_call_original
      FFI::FFmpeg.should_receive(:avcodec_alloc_frame).and_return(av_frame)
    end

    context 'avcodec_alloc_frame fails to allocate a frame' do
      let(:av_frame) do
        double 'FFI::Pointer', to_i: -1
      end

      it 'raises a NoMemoryError' do
        expect {
          subject.send(:init_frame)
        }.to raise_error NoMemoryError
      end
    end

    context 'avcodec_alloc_frame allocs a frame OK' do
      let(:av_frame) do
        double 'FFI::Pointer', to_i: 1
      end

      it 'uses FFmpeg to allocate a new frame and then wraps it with Ruby' do
        FFI::FFmpeg::AVFrame.should_receive(:new).with(av_frame)
        subject.send(:init_frame)
      end
    end
  end

  describe '#finalize' do
    let(:av_frame) { double 'FFI::FFmpeg::AVFrame' }

    before do
      subject.instance_variable_set(:@av_frame, av_frame)
    end

    it 'frees the AVFrame' do
      FFI::FFmpeg.should_receive(:av_free)
      subject.send(:finalize)
    end
  end
end
