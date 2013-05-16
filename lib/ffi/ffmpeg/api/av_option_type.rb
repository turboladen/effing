module FFI
  module FFmpeg

    #---------------------------------------------------------------------------
    # Private!
    #---------------------------------------------------------------------------
    private

    # Wrapper around ffmpegs tag, used for the enum below.
    #
    # @return [Fixnum]
    def self.mkbetag(a, b, c, d)
      (d.bytes.first | (c.bytes.first << 8) | (b.bytes.first << 16) | (a.bytes.first << 24))
    end

    #---------------------------------------------------------------------------
    # Public!
    #---------------------------------------------------------------------------
    public

    AVOptionType = enum :flags,
      :int,
      :int64,
      :double,
      :float,
      :string,
      :rational,
      :binary,
      :const, 128,
      :image_size, mkbetag(*%w[S I Z E]),
      :pixel_fmt, mkbetag(*%w[P F M T]),
      :sample_fmt, mkbetag(*%w[S F M T])
      # Not defining for FF_API_OLD_AVOPTIONS
  end
end
