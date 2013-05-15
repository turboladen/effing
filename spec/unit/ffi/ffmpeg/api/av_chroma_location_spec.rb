require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_chroma_location'


describe 'FFI::FFmpeg::AVChromaLocation' do
  subject { FFI::FFmpeg::AVChromaLocation }

  it 'defines an enum' do
    subject.should be_a FFI::Enum
  end

  it 'uses default enum values' do
    subject[:unspecified].should == 0
    subject[:left].should == 1
    subject[:center].should == 2
    subject[:topleft].should == 3
    subject[:top].should == 4
    subject[:bottomleft].should == 5
    subject[:bottom].should == 6
    subject[:nb].should == 7
  end
end
