require 'ffi'


module FFI
  module FFmpeg
    extend FFI::Library

    LIBRARY_FILENAME = {
      :avutil   => ENV['FFI_FFMPEG_LIBAVUTIL'],
      :avformat => ENV['FFI_FFMPEG_LIBAVFORMAT'],
      :avcodec  => ENV['FFI_FFMPEG_LIBAVCODEC'],
    }

    LIBRARY_FILENAME[:avutil]   ||= %w[libavutil libavutil.so.51]
    LIBRARY_FILENAME[:avformat] ||= %w[libavformat libavformat.so.54 libavformat.so.53]
    LIBRARY_FILENAME[:avcodec]  ||= %w[libavcodec libavcodec.so.54 libavcodec.so.53]


    ###################################################
    #  Functions                                      #
    ###################################################
    @@old_api = false

    # Not actually an enum in libavutil.h, but we make it one here to
    # make the api prettier.
    AVLogLevel   = enum :quiet,   -8,
      :panic,    0,
      :fatal,    8,
      :error,   16,
      :warning, 24,
      :info,    32,
      :verbose, 40,
      :debug,   48

    #--------------------------------------------------
    # libavutil
    #--------------------------------------------------
    require_relative 'ffmpeg/api/av_sample_format'
    ffi_lib LIBRARY_FILENAME[:avutil]

    attach_function :av_log_set_level, [AVLogLevel], :void
    attach_function :av_malloc, [:uint], :pointer
    attach_function :av_free, [:pointer], :void
    attach_function :av_freep, [:pointer], :void
    attach_function :avutil_version, [], :uint
    attach_function :av_samples_alloc,
      [:pointer, :pointer, :int, :int, AVSampleFormat, :int],
      :int
    attach_function :av_samples_copy,
      [:pointer, :pointer, :int, :int, :int, :int, AVSampleFormat],
      :int
    attach_function :av_samples_get_buffer_size,
      [:pointer, :int, :int, AVSampleFormat, :int],
      :int
    attach_function :av_sample_fmt_is_planar, [AVSampleFormat], :int
    attach_function :av_mallocz, [:uint8], :pointer

    #--------------------------------------------------
    # libavformat
    #--------------------------------------------------
    ffi_lib LIBRARY_FILENAME[:avformat]
    attach_function :av_register_all, [], :void

    begin
      attach_function :avformat_open_input,
        [:pointer, :string, :pointer, :int, :pointer],
        :int
      attach_function :av_dump_format,
        [:pointer, :int, :string, :int],
        :void
    rescue
      warn "Using old FFmpeg API; using av_open_input_file instead of avformat_open_input"
       @@old_api = true
      attach_function :av_open_input_file,
        [:pointer, :string, :pointer, :int, :pointer],
        :int
      attach_function :dump_format,
        [:pointer, :int, :string, :int],
        :void
    end

    attach_function :av_find_stream_info, [:pointer], :int
    attach_function :av_read_frame, [:pointer, :pointer], :int
    attach_function :av_seek_frame, [:pointer, :int, :long_long, :int], :int
    attach_function :av_find_default_stream_index, [ :pointer ], :int
    attach_function :avformat_close_input, [:pointer], :void
    attach_function :avformat_version, [], :uint

    attach_function :av_image_alloc,
      [:pointer, :pointer, :int, :int, :int, :int], :int
    attach_function :av_image_copy,
      [:pointer, :pointer, :pointer, :pointer, :int, :int, :int], :void

    if @@old_api
      # This function is inlined in avformat, defining it here
      # for convenience.
      #
      # Original definition:
      #     static inline void av_free_packet(AVPacket *pkt)
      #     {
      #         if (pkt && pkt->destruct) {
      #             pkt->destruct(pkt);
      #         }
      #     }
      #
      def self.av_free_packet(pkt)
        return unless pkt and pkt[:destruct]

        FFI::Function.new(:void, [:pointer], pkt[:destruct],
          :blocking => true).call(pkt)
      end
    else
      attach_function :av_free_packet, [:pointer], :void
    end

    #--------------------------------------------------
    # libavcodec
    #--------------------------------------------------
    ffi_lib LIBRARY_FILENAME[:avcodec]
    attach_function :avcodec_find_decoder, [:int], :pointer
    attach_function :avcodec_open, [:pointer, :pointer], :int
    attach_function :avcodec_open2, [:pointer, :pointer, :pointer], :int
    attach_function :avcodec_alloc_frame, [], :pointer
    attach_function :av_init_packet, [:pointer], :void
    attach_function :avcodec_version, [], :uint
    attach_function :avcodec_decode_audio4,
      [:pointer, :pointer, :pointer, :pointer],
      :int

    if @@old_api
      warn "Using old API avcodec_decode_video()"
      attach_function :avcodec_decode_video, [:pointer, :pointer, :pointer,
        :pointer, :int], :int,
        { :blocking => true }
    else
      attach_function :avcodec_decode_video2,
        [:pointer, :pointer, :pointer, :pointer],
        :int,
        { :blocking => true }
    end

    ###################################################
    #  Definitions                                    #
    ###################################################
    MAX_STREAMS          = 20
    MAX_REORDER_DELAY    = 16
    AV_TIME_BASE         = 1000000
    AV_NUM_DATA_POINTERS = @@old_api ? 4 : 8
    AV_PARSER_PTS_NB     = 4
    AVCODEC_MAX_AUDIO_FRAME_SIZE = 192000

    ###################################################
    #  Enums                                          #
    ###################################################
    require_relative 'ffmpeg/api/av_media_type'
    require_relative 'ffmpeg/api/av_codec_id'

    if @@old_api
      warn "Using old API pixel_format"
      require_relative 'ffmpeg/old_api/pixel_format'
    else
      require_relative 'ffmpeg/api/av_pixel_format'
    end

    ###################################################
    #  Data Structures                                #
    ###################################################
    if @@old_api
      warn "Using old API av_packet"
      warn "Using old API av_stream"
      warn "Using old API av_format_context"
      warn "Using old API av_codec_context"
      warn "Using old API av_frame"

      require_relative 'ffmpeg/old_api/av_packet'
      require_relative 'ffmpeg/old_api/av_stream'
      require_relative 'ffmpeg/old_api/av_codec_context'
      require_relative 'ffmpeg/old_api/av_format_context'
      require_relative 'ffmpeg/old_api/av_frame'
    else
      require_relative 'ffmpeg/api/av_packet'
      require_relative 'ffmpeg/api/av_picture'
      require_relative 'ffmpeg/api/av_stream'
      require_relative 'ffmpeg/api/av_codec_context'
      require_relative 'ffmpeg/api/av_format_context'
      require_relative 'ffmpeg/api/av_frame'
    end

    def old_api?
      @@old_api
    end
    module_function :old_api?

    @@loaded_libraries = ffi_libraries
    def loaded_libraries
      @@loaded_libraries.map { |lib| lib.name }
    end

    # The version of libavutil that was loaded.
    #
    # @return [Hash] :major, :minor, :micro versions.
    def libavutil_version
      return @libavutil_version if @libavutil_version

      version = avutil_version
      major = version >> 16
      minor = version >> 8 & 0b11111111
      micro = version & 0b11111111

      @libavutil_version = {
        major: major,
        minor: minor,
        micro: micro
      }
    end

    def libavutil_old_api?
      libavutil_version[:major] < 52
    end

    # The version of libavformat that was loaded.
    #
    # @return [Hash] :major, :minor, :micro versions.
    def libavformat_version
      return @libavformat_version if @libavformat_version

      version = avformat_version
      major = version >> 16
      minor = version >> 8 & 0b11111111
      micro = version & 0b11111111

      @libavformat_version = {
        major: major,
        minor: minor,
        micro: micro
      }
    end

    def libavformat_old_api?
      libavformat_version[:major] < 55
    end

    # The version of libavcodec that was loaded.
    #
    # @return [Hash] :major, :minor, :micro versions.
    def libavcodec_version
      return @libavcodec_version if @libavcodec_version

      version = avcodec_version
      major = version >> 16
      minor = version >> 8 & 0b11111111
      micro = version & 0b11111111

      @libavcodec_version = {
        major: major,
        minor: minor,
        micro: micro
      }
    end

    def libavcodec_old_api?
      libavcodec_version[:major] < 55
    end

  end # module FFmpeg
end # module FFI
