require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_dictionary_entry'


describe FFI::FFmpeg::AVDictionaryEntry do
  describe 'key' do
    specify { subject[:key].should be_nil }
  end

  describe 'value' do
    specify { subject[:value].should be_nil }
  end
end
