require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_dictionary'


describe FFI::FFmpeg::AVDictionary do
  describe 'count' do
    specify { subject[:count].should == 0 }
  end

  describe 'elems' do
    specify { subject[:elems].should be_a FFI::FFmpeg::AVDictionaryEntry }
  end
end
