module FFI
  module FFmpeg
    class AVCodecDefault < FFI::Struct
      layout :key, :pointer,
        :value, :pointer
    end
  end
end
