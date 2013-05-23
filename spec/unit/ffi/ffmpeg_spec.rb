require 'spec_helper'
require 'ffi/ffmpeg'


describe FFI::FFmpeg do
  subject do
    o = Object.new
    o.send(:extend, FFI::FFmpeg)

    o
  end

  describe 'AVLogLevel' do
    it 'is an FFI::Enum' do
      FFI::FFmpeg::AVLogLevel.should be_a FFI::Enum
    end

    it 'defines multiple levels' do
      hash = FFI::FFmpeg::AVLogLevel.to_hash

      hash[:quiet].should eq -8
      hash[:panic].should eq 0
      hash[:fatal].should eq 8
      hash[:error].should eq 16
      hash[:warning].should eq 24
      hash[:info].should eq 32
      hash[:verbose].should eq 40
      hash[:debug].should eq 48
    end
  end

  describe 'libavutil' do
    specify { FFI::FFmpeg.should respond_to :av_log_set_level }
    specify { FFI::FFmpeg.should respond_to :av_malloc }
    specify { FFI::FFmpeg.should respond_to :av_mallocz }
    specify { FFI::FFmpeg.should respond_to :av_free }
    specify { FFI::FFmpeg.should respond_to :av_freep }

    describe '.avutil_version' do
      specify { FFI::FFmpeg.avutil_version.should > 0 }
    end

    specify do
      pending 'Implementing audio support...'
      FFI::FFmpeg.should respond_to :av_samples_copy
    end

    specify { FFI::FFmpeg.should respond_to :av_samples_get_buffer_size }
    specify { FFI::FFmpeg.should respond_to :av_sample_fmt_is_planar }
  end

  describe 'libavformat' do
    specify { FFI::FFmpeg.should respond_to :av_register_all }
    specify { FFI::FFmpeg.should respond_to :avformat_open_input }
    specify { FFI::FFmpeg.should respond_to :av_dump_format }
    specify do
      FFI::FFmpeg.should(respond_to(:av_find_stream_info)) ||
        FFI::FFmpeg.should(respond_to(:avformat_find_stream_info))
    end

    specify { FFI::FFmpeg.should respond_to :av_read_frame }
    specify { FFI::FFmpeg.should respond_to :av_seek_frame }
    specify { FFI::FFmpeg.should respond_to :av_find_default_stream_index }
    specify { FFI::FFmpeg.should respond_to :avformat_close_input }

    describe '.avformat_version' do
      specify { FFI::FFmpeg.avformat_version.should > 0 }
    end

    specify { FFI::FFmpeg.should respond_to :av_image_alloc }
    specify { FFI::FFmpeg.should respond_to :av_image_copy }
    specify { FFI::FFmpeg.should respond_to :av_free_packet }
  end

  describe 'libavcodec' do
    specify { FFI::FFmpeg.should respond_to :avcodec_find_decoder }
    specify { FFI::FFmpeg.should respond_to :avcodec_open2 }
    specify { FFI::FFmpeg.should respond_to :avcodec_alloc_frame }
    specify { FFI::FFmpeg.should respond_to :av_init_packet }

    describe '.avcodec_version' do
      specify { FFI::FFmpeg.avcodec_version.should > 0 }
    end

    specify { FFI::FFmpeg.should respond_to :avcodec_decode_audio4 }
    specify { FFI::FFmpeg.should respond_to :avcodec_decode_video2 }
  end

  describe '#loaded_libraries' do
    it 'returns an Array of loaded libraries' do
      subject.loaded_libraries.should_not be_empty
    end
  end

  describe '#libavutil_version' do
    it 'returns a Hash with :major, :minor, and :micro set' do
      hash = subject.libavutil_version

      hash[:major].should >= 51
      hash[:minor].should >= 0
      hash[:micro].should >= 0
    end
  end

  describe '#libavformat_version' do
    it 'returns a Hash with :major, :minor, and :micro set' do
      hash = subject.libavformat_version

      hash[:major].should >= 53
      hash[:minor].should >= 0
      hash[:micro].should >= 0
    end
  end

  describe '#libavcodec_version' do
    it 'returns a Hash with :major, :minor, and :micro set' do
      hash = subject.libavcodec_version

      hash[:major].should >= 53
      hash[:minor].should >= 0
      hash[:micro].should >= 0
    end
  end
end
