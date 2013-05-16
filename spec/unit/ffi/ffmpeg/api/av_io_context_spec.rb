require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_io_context'


describe FFI::FFmpeg::AVIOContext do
  context 'defaults' do
    describe 'av_class' do
      specify { subject[:av_class].should be_a FFI::FFmpeg::AVClass }
    end

    describe 'buffer' do
      specify { subject[:buffer].should be_a FFI::Pointer }
      specify { subject[:buffer].address.should == 0 }
    end

    describe 'buffer_size' do
      specify { subject[:buffer_size].should == 0 }
    end

    describe 'buf_ptr' do
      specify { subject[:buf_ptr].should be_a FFI::Pointer }
      specify { subject[:buf_ptr].address.should == 0 }
    end

    describe 'buf_end' do
      specify { subject[:buf_end].should be_a FFI::Pointer }
      specify { subject[:buf_end].address.should == 0 }
    end

    describe 'opaque' do
      specify { subject[:opaque].should be_a FFI::Pointer }
      specify { subject[:opaque].address.should == 0 }
    end

    describe 'read_packet' do
      specify { subject[:read_packet].should be_a FFI::Pointer }
      specify { subject[:read_packet].address.should == 0 }
    end

    describe 'write_packet' do
      specify { subject[:write_packet].should be_a FFI::Pointer }
      specify { subject[:write_packet].address.should == 0 }
    end

    describe 'seek' do
      specify { subject[:seek].should be_a FFI::Pointer }
      specify { subject[:seek].address.should == 0 }
    end

    describe 'pos' do
      specify { subject[:pos].should == 0 }
    end

    describe 'must_flush' do
      specify { subject[:must_flush].should == 0 }
    end

    describe 'eof_reached' do
      specify { subject[:eof_reached].should == 0 }
    end

    describe 'write_flag' do
      specify { subject[:write_flag].should == 0 }
    end

    describe 'max_packet_size' do
      specify { subject[:max_packet_size].should == 0 }
    end

    describe 'checksum' do
      specify { subject[:checksum].should == 0 }
    end

    describe 'checksum_ptr' do
      specify { subject[:checksum_ptr].should be_a FFI::Pointer }
      specify { subject[:checksum_ptr].address.should == 0 }
    end

    describe 'update_checksum' do
      specify { subject[:update_checksum].should be_a FFI::Pointer }
      specify { subject[:update_checksum].address.should == 0 }
    end

    describe 'error' do
      specify { subject[:error].should == 0 }
    end

    describe 'read_pause' do
      specify { subject[:read_pause].should be_a FFI::Pointer }
      specify { subject[:read_pause].address.should == 0 }
    end

    describe 'read_seek' do
      specify { subject[:read_seek].should be_a FFI::Pointer }
      specify { subject[:read_seek].address.should == 0 }
    end

    describe 'seekable' do
      specify { subject[:seekable].should == 0 }
    end

    describe 'maxsize' do
      specify { subject[:maxsize].should == 0 }
    end

    describe 'direct' do
      specify { subject[:direct].should == 0 }
    end

    describe 'bytes_read' do
      specify { subject[:bytes_read].should == 0 }
    end

    describe 'seek_count' do
      specify { subject[:seek_count].should == 0 }
    end
  end
end
