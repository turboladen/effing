require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_class_category'


describe 'FFI::FFmpeg::AVClassCategory' do
  subject { FFI::FFmpeg::AVClassCategory }

  it 'defines an enum' do
    subject.should be_a FFI::Enum
  end

  it 'starts with 0, then uses default values' do
    subject[:na].should == 0
    subject[:input].should == 1
    subject[:output].should == 2
    subject[:muxer].should == 3
    subject[:demuxer].should == 4
    subject[:encoder].should == 5
    subject[:decoder].should == 6
    subject[:filter].should == 7
    subject[:bitstream_filter].should == 8
    subject[:swscaler].should == 9
    subject[:swresampler].should == 10
    subject[:nb].should == 11
  end
end
