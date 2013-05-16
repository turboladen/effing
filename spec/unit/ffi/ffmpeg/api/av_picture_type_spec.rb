require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_picture_type'


describe 'FFI::FFmpeg::AVPictureType' do
  subject { FFI::FFmpeg::AVPictureType }

  specify { subject[:none].should == 0 }
  specify { subject[:i].should    == 1 }
  specify { subject[:p].should    == 2 }
  specify { subject[:b].should    == 3 }
  specify { subject[:s].should    == 4 }
  specify { subject[:si].should   == 5 }
  specify { subject[:sp].should   == 6 }
  specify { subject[:bi].should   == 7 }
end
