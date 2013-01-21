require_relative 'av_option_type'
require_relative 'av_rational'


module FFI
  module FFmpeg
    class DefaultVal < FFI::Union
      layout :i64, :int64,
        :dbl, :double,
        :str, :string,
        :q, AVRational
    end


    class AVOption < FFI::Struct
      layout :name, :string,
        :help, :string,
        :offset, :int,
        :type, AVOptionType,
        :default_val, DefaultVal,
        :min, :double,
        :max, :double,
        :flags, :int,
        :unit, :string
    end
  end
end
