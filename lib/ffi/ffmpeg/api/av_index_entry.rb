module FFI
  module FFmpeg
    class AVIndexEntry < FFI::Struct
      layout :pos,      :int64,
        :timestamp,     :int64,
        :flags,         :int,
        :size,          :int,
        :min_distance,  :int
    end
  end
end
