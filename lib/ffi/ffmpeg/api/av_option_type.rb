module FFI
  module FFmpeg
    AVOptionType = enum :flags,
      :int,
      :int64,
      :double,
      :float,
      :string,
      :rational,
      :binary,
      :const, 128,
      :image_size, 'SIZE',
      :pixel_fmt, 'PFMT',
      :sample_fmt, 'SFMT'
      # Not defining for FF_API_OLD_AVOPTIONS
  end
end
