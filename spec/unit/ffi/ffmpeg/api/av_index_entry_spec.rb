require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_index_entry'


describe FFI::FFmpeg::AVIndexEntry do
  context 'defaults' do
    describe 'pos' do
      specify { subject[:pos].should == 0 }
    end

    describe 'timestamp' do
      specify { subject[:timestamp].should == 0 }
    end

    describe 'flags' do
      specify { subject[:flags].should == 0 }
    end

    describe 'size' do
      specify { subject[:size].should == 0 }
    end

    describe 'min_distance' do
      specify { subject[:min_distance].should == 0 }
    end
  end
end
