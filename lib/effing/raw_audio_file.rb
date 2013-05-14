require_relative '../ffi/libc'
require_relative '../ffi/ffmpeg'


class Effing

  # Handles writing raw audio frames to a file.
  class RawAudioFile

    def initialize(file_name, sample_fmt)
      #@file = FFI::LibC.fopen(file_name, 'wb')
      @file = File.open(file_name, 'wb')
      @file_name = file_name
      @sample_fmt = sample_fmt
    end

    # Properly aligns frames before writing to file, then writes the frame out
    # to the file.
    #
    # @param [FFI::Struct::InlineArray] av_frame Info from an
    #   FFI::FFmpeg::AVFrame.
    def write(av_frame)
      dest_data, destination_buffer_size = init_destination_samples(av_frame)
      line_size = FFI::MemoryPointer.new(:int)

      ret = FFI::FFmpeg.av_samples_alloc(
        dest_data, line_size,
        av_frame[:channels], av_frame[:nb_samples],
        av_frame[:format], 1
      )
      if ret < 0
        msg = 'Could not allocate audio buffer'
        msg << "\nline_size: #{line_size}"
        msg << "\nnb samples: #{av_frame[:nb_samples]}"
        msg << "\nformat: #{av_frame[:format]}"
        msg << "\nsample fmt: #{av_frame[:sample_fmt]}"
        raise NoMemoryError, msg
      end

      FFI::FFmpeg.av_samples_copy(dest_data, av_frame[:data], 0, 0,
        av_frame[:nb_samples], av_frame[:channels], av_frame[:format])

      #FFI::LibC.fwrite(
      #  dest_data[0],
      #  1,
      #  destination_buffer_size,
      #  @file
      #)
      @offset ||= 0

      av_frame[:channels].times do |i|
        #File.write(@file_name, dest_data.read_array_of_pointer(FFI::FFmpeg::AV_NUM_DATA_POINTERS)[i].
        File.write(@file_name, dest_data[i],
          destination_buffer_size * @offset)
      end

      @offset += 1

      FFI::FFmpeg.av_freep(dest_data)
    end

    # Closes the file.
    #
    # @return [Fixnum] 0 if it was successfully closed.
    def close
      #FFI::LibC.fclose(@file)
      @file.close
    end

    private

    def init_destination_samples(av_frame)
      nb_planes = if FFI::FFmpeg.av_sample_fmt_is_planar(@sample_fmt) == 1
        av_frame[:channels]
      else
        1
      end

      bufsize = FFI::FFmpeg.av_samples_get_buffer_size(nil, av_frame[:channels],
        av_frame[:nb_samples], av_frame[:format], 1)

      dest_data = FFI::FFmpeg.av_mallocz(FFI::MemoryPointer.new(:uint8).size * nb_planes)

      [dest_data, bufsize]
    end
  end
end
