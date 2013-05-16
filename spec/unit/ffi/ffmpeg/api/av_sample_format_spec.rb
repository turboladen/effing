require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_sample_format'


describe 'FFI::FFmpeg::AVSampleFormat' do
  subject { FFI::FFmpeg::AVSampleFormat }

  specify { subject[:none].should == -1 }
  specify { subject[:u8].should   == 0 }
  specify { subject[:s16].should  == 1 }
  specify { subject[:s32].should  == 2 }
  specify { subject[:flt].should  == 3 }
  specify { subject[:dbl].should  == 4 }
  specify { subject[:u8p].should  == 5 }
  specify { subject[:s16p].should == 6 }
  specify { subject[:s32p].should == 7 }
  specify { subject[:fltp].should == 8 }
  specify { subject[:dblp].should == 9 }
  specify { subject[:nb].should   == 10 }
end
