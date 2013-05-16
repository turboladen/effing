require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_packet_list'


describe FFI::FFmpeg::AVPacketList do
  context 'defaults' do
    describe 'pkt' do
      specify { subject[:pkt].should be_a FFI::FFmpeg::AVPacket }
    end

    describe 'next' do
      specify { subject[:next].should be_a FFI::FFmpeg::AVPacketList }
    end
  end
end
