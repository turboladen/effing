require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_color_range'


describe 'FFI::FFmpeg::AVColorRange' do
  subject { FFI::FFmpeg::AVColorRange }
  specify { subject[:unspecified].should == 0 }
  specify { subject[:mpeg].should == 1 }
  specify { subject[:jpeg].should == 2 }
  specify { subject[:nb].should == 3 }
end
