module FFI
  module FFmpeg
    AVDurationEstimationMethod = enum :pts,
                                      :stream,
                                      :bitrate
  end
end