#!/usr/bin/env ruby

require 'thor'
require './lib/effing'
#require 'bundler/setup'


class Tester < Thor
  desc "demux [FILE] [TYPE]", "Demuxes a [TYPE] stream from [FILE]"
  method_option :playback_method, type: :string, :default => 'codec'
  def demux(file_path, stream_type)
    Effing.log = false
    stream_type = stream_type.to_sym

    stream_reader = Effing::StreamReader.new(file_path, stream_type)
    destination_file_name = "tester_demuxed_file"
    destination_file = FFI::LibC.fopen(destination_file_name, 'wb')

    play_back_codec = stream_reader.stream.av_stream[:codec][:codec][:name]
    input_format = stream_reader.file_reader.av_format_context[:iformat][:name]

    puts "Codec name: #{play_back_codec}"
    puts "Input format: #{input_format}"

    stream_reader.demux do |packet|
      warn "Got null data packet" if packet[:data].null?

      unless packet[:dts] >= 0
        FFI::LibC.fwrite(
          packet[:data],
          packet[:size],
          1,
          destination_file
        )
      end
    end

    FFI::LibC::fclose(destination_file)

    cmd = if options[:playback_method] == 'codec'
      "ffplay -vcodec #{play_back_codec} "
    elsif options[:playback_method] == 'format'
      "ffplay -f #{input_format} "
    end

    cmd << "-loglevel debug "
    cmd << destination_file_name
    puts "Playing the output video file with the command:\n#{cmd}"

    system(cmd)
  rescue
    FileUtils.rm_rf(destination_file_name)

    raise
  ensure
    FileUtils.rm_rf(destination_file_name)
  end

  desc "decode [FILE] [TYPE]", "Demuxes a [TYPE] stream from [FILE]"
  def decode(file_path, stream_type)
    Effing.log = true
    stream_type = stream_type.to_sym
    stream_reader = Effing::StreamReader.new(file_path, stream_type)
    destination_file_name = "tester_decoded_file"

    destination_file = if stream_type == :video
      Effing::RawVideoFile.new(destination_file_name,
        stream_reader.stream.width,
        stream_reader.stream.height,
        stream_reader.stream.pixel_format
      )
    elsif stream_type == :audio
      Effing::RawAudioFile.new(destination_file_name,
        stream_reader.stream.av_codec_context[:sample_fmt]
      )
    end

    if stream_type == :video
      stream_reader.decode do |frame|
        warn "Got null data frame" if frame.av_frame[:data].to_a.empty?
        destination_file.write(frame.av_frame[:data], frame.av_frame[:linesize])
      end
    elsif stream_type == :audio
      stream_reader.decode do |frame|
        destination_file.write(frame.av_frame)
      end
    end

    destination_file.close

    if stream_type == :video
      cmd = "ffplay -f rawvideo "
      cmd << "-pixel_format #{stream_reader.stream.pixel_format} "
      cmd << "-video_size #{stream_reader.stream.width}x#{stream_reader.stream.height} "
    elsif stream_type == :audio
      cmd = "ffplay -f #{stream_reader.stream.format}le "
      cmd << "-ac #{stream_reader.stream.channels} "
      cmd << "-ar #{stream_reader.stream.sample_rate} "
      cmd << "-showmode 2 "
    end

    cmd << "-t #{stream_reader.file_reader.duration} "
    cmd << "-loglevel debug "
    cmd << "-autoexit "
    cmd << "  -i " << destination_file_name
    puts "Playing the output video file with the command:\n#{cmd}"

    system(cmd)
  rescue
    #FileUtils.rm_rf(destination_file_name)

    raise
  ensure
    #FileUtils.rm_rf(destination_file_name)
  end
end

Tester.start
