module FFI
  module FFmpeg
    class AVDictionaryEntry < FFI::Struct
      layout :key, :string,
        :value, :string
    end
  end
end