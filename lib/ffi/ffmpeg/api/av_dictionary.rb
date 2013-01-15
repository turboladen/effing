require_relative 'av_dictionary_entry'


module FFI
  module FFmpeg
    class AVDictionary < FFI::Struct
      layout :count, :int64,
        :elems, AVDictionaryEntry.ptr
    end
  end
end
