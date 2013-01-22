module FFI
  module FFmpeg
    class AVPacketList < FFI::Struct
      layout  :pkt, AVPacket,
              :next, AVPacketList.ptr
    end
  end
end
