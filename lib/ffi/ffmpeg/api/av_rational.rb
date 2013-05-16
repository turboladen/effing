module FFI
  module FFmpeg
    class AVRational < FFI::Struct
      layout  :num, :int,
              :den, :int

      # @return [Float] +num+ / +den+.
      def to_f
        self[:num].to_f / self[:den]
      end

      # @return [Integer] +num+ / +den+.
      def to_i
        self[:num] / self[:den]
      end

      # @return [String]
      def to_s
        "#<#{self.class}:0x%016x num=%d, den=%d, %f>" %
            [object_id, self[:num], self[:den], to_f]
      end
    end
  end
end
