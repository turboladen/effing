require_relative 'file_reader'


class Effer

  # A decoder that demuxes then decodes (to raw audio or video) a single stream.
  class Decoder

    # @return [Effer::Stream] The stream that will be decoded.
    attr_reader :stream

    attr_reader :reader

    # @param [String] file_name Name/path of the file to decode.
    # @param [Symbol,Fixnum] stream The identifier for which stream to decode
    #   from the file.  Can be +:video+, +:audio+ (in which case, the first
    #   stream found of that type will be used) or a number that corresponds to
    #   the stream index of the stream to deocde.
    def initialize(file_name, stream)
      @reader = Effer::FileReader.new(file_name)
      @stream = find_stream(stream)
    end

    # Decodes each frame for the stream and yields it.
    def each_frame(&block)
      @stream.each_frame(&block)
    end

    private

    # Allows for finding a stream in the file using Symbols or Fixnums.
    #
    # @param [Symbol,Fixnum] stream_id The stream to look for.
    # @return [Effer::Stream] The audio or video stream that corresponds to
    #   the given stream_id.
    def find_stream(stream_id)
      @reader.dump_format

      if stream_id.is_a? Symbol
        @reader.streams.find { |stream| stream.type == stream_id }
      elsif stream_id.to_i
        @reader.streams.find { |stream| stream.index == stream_id.to_i }
      end
    end
  end
end