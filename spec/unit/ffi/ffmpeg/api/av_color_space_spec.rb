require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_color_space'


describe 'FFI::FFmpeg::AVColorSpace' do
  subject { FFI::FFmpeg::AVColorSpace }

  specify { subject[:rgb].should == 0 }
  specify { subject[:bt709].should == 1 }
  specify { subject[:unspecified].should == 2 }
  specify { subject[:fcc].should == 4 }
  specify { subject[:bt470bg].should == 5 }
  specify { subject[:smpte170m].should == 6 }
  specify { subject[:smpte240m].should == 7 }
  specify { subject[:ycocg].should == 8 }
  specify { subject[:nb].should == 9 }
end
