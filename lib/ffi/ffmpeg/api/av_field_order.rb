module FFI
  module FFmpeg
    AVFieldOrder = enum :unknown,
                        :progressive,
                        :tt,
                        :bb,
                        :tb,
                        :bt
  end
end