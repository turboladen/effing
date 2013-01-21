require_relative 'av_class'


module FFI
  module FFmpeg
    class AVIOContext < FFI::Struct
      layout :av_class,   AVClass.ptr,
        :buffer,          :pointer,
        :buffer_size,     :int,
        :buf_ptr,         :pointer,
        :buf_end,         :pointer,
        :opaque,          :pointer,
        :read_packet,     :pointer,
        :write_packet,    :pointer,
        :seek,            :pointer,
        :pos,             :int64,
        :must_flush,      :int,
        :eof_reached,     :int,
        :write_flag,      :int,
        :max_packet_size, :int,
        :checksum,        :ulong,
        :checksum_ptr,    :pointer,
        :udpate_checksum, :pointer,
        :error,           :int,
        :read_pause,      :pointer,
        :read_seek,       :pointer,
        :seekable,        :int,
        :maxsize,         :int64,
        :direct,          :int,
        :bytes_read,      :int64,
        :seek_count,      :int
    end
  end
end
