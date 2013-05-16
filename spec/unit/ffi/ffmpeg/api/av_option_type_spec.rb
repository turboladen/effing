require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_option_type'


describe 'FFI::FFmpeg::AVOptionType' do
  subject { FFI::FFmpeg::AVOptionType }

  specify { subject[:flags].should == 0 }
  specify { subject[:int].should == 1 }
  specify { subject[:int64].should == 2 }
  specify { subject[:double].should == 3 }
  specify { subject[:float].should == 4 }
  specify { subject[:string].should == 5 }
  specify { subject[:rational].should == 6 }
  specify { subject[:binary].should == 7 }
  specify { subject[:const].should == 128 }
  specify { subject[:image_size].should == 1397316165 }
  specify { subject[:pixel_fmt].should == 1346784596 }
  specify { subject[:sample_fmt].should == 1397116244 }
end
