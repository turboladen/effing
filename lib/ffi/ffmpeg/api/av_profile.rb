module FFI
  module FFmpeg
    class AVProfile < FFI::Struct
      layout :profile, :int,
        :name, :string
    end
  end
end
