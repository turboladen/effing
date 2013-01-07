module FFI
  module FFmpeg
    AVStreamParseType = enum :none,
                             :full,
                             :headers,
                             :timestamps,
                             :full_once,
                             :full_raw
  end
end
