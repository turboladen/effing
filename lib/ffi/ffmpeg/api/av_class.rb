require_relative 'av_class_category'
require_relative 'av_option'


module FFI
  module FFmpeg
    class AVClass < FFI::Struct
      layout :class_name, :string,
        :item_name, :pointer,
        :option, AVOption.ptr,
        :version, :int,
        :log_level_offset_offset, :int,
        :parent_log_content_offset, :int,
        :child_next, :pointer,
        :child_class_next, :pointer,
        :category, AVClassCategory,
        :get_category, :pointer,
        :query_ranges, :pointer
    end
  end
end
