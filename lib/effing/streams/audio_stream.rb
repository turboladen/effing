require_relative 'base_stream'
require_relative '../frames/audio_frame'


class Effing
  module Streams
    class AudioStream < BaseStream
      include LogSwitch::Mixin

      attr_reader :raw_frame, :channels, :sample_format, :sample_rate, :format

      def initialize(av_stream, av_format_context)
        super(av_stream, av_format_context)

        @channels = @av_codec_context[:channels].zero? ? nil : @av_codec_context[:channels]
        @sample_format = @av_codec_context[:sample_fmt]
        @raw_frame = Effing::Frames::AudioFrame.new
      end

      def decode_frame(packet)
        len = if FFI::FFmpeg.old_api?
          abort 'Audio decoding not implemented for old FFmpeg API'
        else
          avcodec_decode_audio4(@av_codec_context, @raw_frame.av_frame,
            @frame_finished, packet)
        end

        if len > 0
          log "Read bytes: #{len}"
        elsif len.zero?
          warn 'Could not decompress frame'
        else
          warn 'Negative return on decompressing frame; could be an error...'
        end

        if @frame_finished.read_int >= 0
          @channels = @raw_frame.av_frame[:channels]
          @sample_rate = @raw_frame.av_frame[:sample_rate]
          @format = AVSampleFormat[@raw_frame.av_frame[:format]]

          log 'Frame info:'
          log "\tSample count: #{@raw_frame.av_frame[:nb_samples]}"
          log "\tPacket presentation timestamp: #{@raw_frame.av_frame[:pkt_pts]}"
          log "\tPacket display timestamp: #{@raw_frame.av_frame[:pkt_dts]}"
          log "\tSample rate: #{@raw_frame.av_frame[:sample_rate]}"
          log "\tChannels: #{@raw_frame.av_frame[:channels]}"
          log "\tPacket size: #{@raw_frame.av_frame[:pkt_size]}"
          log "\tFormat: #{AVSampleFormat[@raw_frame.av_frame[:format]]}"
          return @raw_frame
        else
          log "frame_finished: #{@frame_finished.read_int}"
        end
      end
    end
  end
end
