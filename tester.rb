require './lib/effer/file_reader'
require './lib/effer/raw_video_file'

require './lib/effer/decoder'

start_time = Time.now
=begin
#Effer.log = true
#reader = Effer::FileReader.new(ARGV.first)
#reader.dump_format

#video_stream = reader.streams.find { |stream| stream.type == :video }
#abort "No video stream found" unless video_stream
#pp video_stream

#video_dst_file = Effer::RawVideoFile.new('raw_video',
#  video_stream.width,
#  video_stream.height,
#  video_stream.pixel_format)

decoder = Effer::Decoder.new(ARGV.first, :video)
#video_stream.each_frame do |frame|

video_dst_file = Effer::RawVideoFile.new('raw_video',
  decoder.stream.width,
  decoder.stream.height,
  decoder.stream.pixel_format)

decoder.each_frame do |frame|
  puts "frame pict type: #{frame.av_frame[:pict_type]}"
  puts "frame format: #{frame.av_frame[:format]}"
  puts "frame width: #{frame.av_frame[:width]}"
  puts "frame height: #{frame.av_frame[:height]}"
  puts "frame presentation time stamp: #{frame.av_frame[:pts]}"
  puts "frame coded picture number: #{frame.av_frame[:coded_picture_number]}"
  puts "frame display picture number: #{frame.av_frame[:display_picture_number]}"
  puts "frame quality: #{frame.av_frame[:quality]}"
  puts "frame packet size: #{frame.av_frame[:pkt_size]}"

  video_dst_file.write(frame.av_frame[:data], frame.av_frame[:linesize])
end

video_dst_file.close

end_time = Time.now
puts "Total decoding time: #{end_time - start_time}"

cmd = "ffplay -f rawvideo "
#cmd << "-pixel_format #{video_stream.pixel_format} "
cmd << "-pixel_format #{decoder.stream.pixel_format} "
#cmd << "-video_size #{video_stream.width}x#{video_stream.height} "
cmd << "-video_size #{decoder.stream.width}x#{decoder.stream.height} "
#cmd << "-t #{reader.duration} "
cmd << "-t #{decoder.reader.duration} "
cmd << "-loglevel debug "
cmd << "raw_video"
puts "Play the output video file with the command:\n#{cmd}"
`#{cmd}`


=end

require './lib/effer/demuxer'

demuxer = Effer::Demuxer.new(ARGV.first, :video)
video_dst_file = FFI::LibC.fopen('raw_mpeg4_video', 'wb')

#video_stream.each_packet do |packet|
demuxer.each_packet do |packet|
  unless packet[:data].null?
    FFI::LibC.fwrite(
      packet[:data],
      packet[:size],
      1,
      video_dst_file
    )
  end
end

FFI::LibC.fclose(video_dst_file)

end_time = Time.now
puts "Total demuxing time: #{end_time - start_time}"

cmd = "ffplay -f m4v "
#cmd << "-t #{reader.duration} "
cmd << "-t #{demuxer.reader.duration} "
cmd << "-loglevel debug "
cmd << "raw_mpeg4_video"
puts "Play the output video file with the command:\n#{cmd}"
`#{cmd}`

