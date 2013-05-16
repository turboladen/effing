require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_format_context'


describe FFI::FFmpeg::AVFormatContext do
  context 'defaults' do
    describe 'av_class' do
      specify { subject[:av_class].should be_a FFI::FFmpeg::AVClass }
    end

    describe 'iformat' do
      specify { subject[:iformat].should be_a FFI::FFmpeg::AVInputFormat }
    end

    describe 'oformat' do
      specify { subject[:oformat].should be_a FFI::FFmpeg::AVOutputFormat }
    end

    describe 'priv_data' do
      specify { subject[:priv_data].should be_a FFI::Pointer }
      specify { subject[:priv_data].address.should == 0 }
    end

    describe 'pb' do
      specify { subject[:pb].should be_a FFI::FFmpeg::AVIOContext }
    end

    describe 'ctx_flags' do
      specify { subject[:ctx_flags].should == 0 }
    end

    describe 'nb_streams' do
      specify { subject[:nb_streams].should == 0 }
    end

    describe 'streams' do
      specify { subject[:streams].should be_a FFI::Pointer }
      specify { subject[:streams].address.should == 0 }
    end

    describe 'filename' do
      specify { subject[:filename].should be_a FFI::Struct::InlineArray }
      specify { subject[:filename].size.should == 1024 }
    end

    describe 'start_time' do
      specify { subject[:start_time].should == 0 }
    end

    describe 'duration' do
      specify { subject[:duration].should == 0 }
    end

    describe 'bit_rate' do
      specify { subject[:bit_rate].should == 0 }
    end

    describe 'packet_size' do
      specify { subject[:packet_size].should == 0 }
    end

    describe 'max_delay' do
      specify { subject[:max_delay].should == 0 }
    end

    describe 'flags' do
      specify { subject[:flags].should == 0 }
    end

    describe 'probesize' do
      specify { subject[:probesize].should == 0 }
    end

    describe 'max_analyze_duration' do
      specify { subject[:max_analyze_duration].should == 0 }
    end

    describe 'key' do
      specify { subject[:key].should be_a FFI::Pointer }
      specify { subject[:key].address.should == 0 }
    end

    describe 'keylen' do
      specify { subject[:keylen].should == 0 }
    end

    describe 'nb_programs' do
      specify { subject[:nb_programs].should == 0 }
    end

    describe 'programs' do
      specify { subject[:programs].should be_a FFI::Pointer }
      specify { subject[:programs].address.should == 0 }
    end

    describe 'video_codec_id' do
      specify { subject[:video_codec_id].should == :none }
    end

    describe 'audio_codec_id' do
      specify { subject[:audio_codec_id].should == :none }
    end

    describe 'subtitle_codec_id' do
      specify { subject[:subtitle_codec_id].should == :none }
    end

    describe 'max_index_size' do
      specify { subject[:max_index_size].should == 0 }
    end

    describe 'max_picture_buffer' do
      specify { subject[:max_picture_buffer].should == 0 }
    end

    describe 'nb_chapters' do
      specify { subject[:nb_chapters].should == 0 }
    end

    describe 'metadata' do
      specify { subject[:metadata].should be_a FFI::FFmpeg::AVDictionary }
    end

    describe 'start_time_realitime' do
      specify { subject[:start_time_realtime].should == 0 }
    end

    describe 'fps_probe_size' do
      specify { subject[:fps_probe_size].should == 0 }
    end

    describe 'error_recognition' do
      specify { subject[:error_recognition].should == 0 }
    end

    describe 'interrupt_callback' do
      specify { subject[:interrupt_callback].should be_a FFI::FFmpeg::AVIOInterruptCB }
    end

    describe 'debug' do
      specify { subject[:debug].should == 0 }
    end

    describe 'ts_id' do
      specify { subject[:ts_id].should == 0 }
    end

    describe 'audio_preload' do
      specify { subject[:audio_preload].should == 0 }
    end

    describe 'max_chunk_duration' do
      specify { subject[:max_chunk_duration].should == 0 }
    end

    describe 'max_chunk_size' do
      specify { subject[:max_chunk_size].should == 0 }
    end

    describe 'use_wallclock_as_timestamps' do
      specify { subject[:use_wallclock_as_timestamps].should == 0 }
    end

    describe 'avoid_negative_ts' do
      specify { subject[:avoid_negative_ts].should == 0 }
    end

    describe 'avio_flags' do
      specify { subject[:avio_flags].should == 0 }
    end

    describe 'duration_estimation_method' do
      specify { subject[:duration_estimation_method].should == :pts }
    end

    describe 'packet_buffer' do
      specify { subject[:packet_buffer].should be_a FFI::FFmpeg::AVPacketList }
    end

    describe 'packet_buffer_end' do
      specify { subject[:packet_buffer_end].should be_a FFI::FFmpeg::AVPacketList }
    end

    describe 'data_offset' do
      specify { subject[:data_offset].should == 0 }
    end

    describe 'raw_packet_buffer' do
      specify { subject[:raw_packet_buffer].should be_a FFI::FFmpeg::AVPacketList }
    end

    describe 'raw_packet_buffer_end' do
      specify { subject[:raw_packet_buffer_end].should be_a FFI::FFmpeg::AVPacketList }
    end

    describe 'parse_queue' do
      specify { subject[:parse_queue].should be_a FFI::FFmpeg::AVPacketList }
    end

    describe 'parse_queue_end' do
      specify { subject[:parse_queue_end].should be_a FFI::FFmpeg::AVPacketList }
    end

    describe 'raw_packet_buffer_remaining_size' do
      specify { subject[:raw_packet_buffer_remaining_size].should == 0 }
    end
  end

  describe '#to_hash' do
    it 'returns a Hash made up of internal values' do
      subject.to_hash.should_not be_empty
    end
  end
end
