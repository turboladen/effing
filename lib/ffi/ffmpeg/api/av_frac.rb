module FFI
  module FFmpeg
    class AVFrac < FFI::Struct
      layout  :val, :int64,
              :num, :int64,
              :den, :int64

      # @return [Float] +val+ + +num+ / +den+.
      def to_f
        self[:val] + self[:num].to_f / self[:den]
      end

      # @return [Integer] +val+ + +num+ / +den+.
      def to_i
        self[:val] + self[:num] / self[:den]
      end

      # @return [String]
      def to_s
        "#<#{self.class}:0x%016x val=%d, num=%d, den=%d, %f>" %
            [object_id, self[:val], self[:num], self[:den], to_f]
      end
    end
  end
end
