require 'spec_helper'
require 'effing/stream_reader'


Effing.log = false

describe 'Demuxing streams' do
  shared_examples_for 'a video demuxer' do
    it 'demuxes without errors' do
      received_packets = []
      stream_reader = Effing::StreamReader.new(file, :video)
      stream_reader.demux do |packet|
        received_packets << packet
      end

      puts "received packets: #{received_packets.size}"
      received_packets.size.should be > 0
    end
  end

  shared_examples_for 'an audio demuxer' do
    it 'demuxes without errors' do
      received_packets = []
      stream_reader = Effing::StreamReader.new(file, :audio)
      stream_reader.demux do |packet|
        received_packets << packet
      end

      puts "received packets: #{received_packets.size}"
      received_packets.size.should be > 0
    end
  end

  Dir[File.dirname(__FILE__) + '/../support/*'].each do |file|
    context file do
      let(:file) { file }
      it_should_behave_like 'a video demuxer'
      it_should_behave_like 'an audio demuxer'
    end
  end
end
