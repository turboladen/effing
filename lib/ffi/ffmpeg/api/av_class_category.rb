module FFI
  module FFmpeg
    AVClassCategory = enum :na, 0,
      :input,
      :output,
      :muxer,
      :demuxer,
      :encoder,
      :decoder,
      :filter,
      :bitstream_filter,
      :swscaler,
      :swresampler,
      :nb
  end
end
