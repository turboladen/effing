require_relative 'file_reader'
require_relative 'logger'


class Effing

  # A StreamReader allows for extracting a single stream at a time via decoding
  # or demultiplexing it.
  class StreamReader
    include LogSwitch::Mixin

    # @return [Effing::Stream] The stream that will be demuxed.
    attr_reader :stream

    # @return [Effing::FileReader]
    attr_reader :file_reader

    # @param [String] file_name Name/path of the file to demux.
    # @param [Symbol,Fixnum] stream The identifier for which stream to demux
    #   from the file.  Can be +:video+, +:audio+ (in which case, the first
    #   stream found of that type will be used) or a number that corresponds to
    #   the stream index of the stream to extract.
    def initialize(file_name, stream)
      @file_reader = Effing::FileReader.new(file_name)
      @stream = find_stream(stream)
    end

    # Demuxes each packet for the stream and yields it.
    def demux(&block)
      @stream.each_packet(&block)
    end

    # Decodes each frame for the stream and yields it.
    def decode(&block)
      @stream.each_frame(&block)
    end

    private

    # Allows for finding a stream in the file using Symbols or Fixnums.
    #
    # @param [Symbol,Fixnum] stream_id The stream to look for.
    # @return [Effing::Stream] The audio or video stream that corresponds to
    #   the given stream_id.  Returns +nil+ if no stream found.
    def find_stream(stream_id)
      @file_reader.dump_format if Effing.log?
      warn 'No streams found in file' if @file_reader.streams.empty?

      stream = if stream_id.is_a? Symbol
        @file_reader.streams.find do |stream|
          log "stream type: '#{stream.type}'"
          stream.type == stream_id
        end
      elsif stream_id.to_i
        @file_reader.streams.find do |stream|
          log "stream type: '#{stream.type}'"
          stream.index == stream_id.to_i
        end
      #else
      #  abort "Don't know how to find stream using '#{stream_id}' (#{stream_id.class})"
      end

      if stream
        log "Found stream #{stream.inspect}"
        stream
      else
        log "Stream not found!"
        raise "No stream found matching stream_id: #{stream_id}"
      end
    end
  end
end
