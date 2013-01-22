module FFI
  module FFmpeg
    class AVPanScan < FFI::Struct
      layout :id,   :int,
        :width,     :int,
        :height,    :int,
        :position,  [:int16, 3]
    end
  end
end
