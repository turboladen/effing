require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_media_type'


describe 'FFI::FFmpeg::AVMediaType' do
  subject { FFI::FFmpeg::AVMediaType }

  specify { subject[:unknown].should == -1 }
  specify { subject[:video].should == 0 }
  specify { subject[:audio].should == 1 }
  specify { subject[:data].should == 2 }
  specify { subject[:subtitle].should == 3 }
  specify { subject[:attachment].should == 4 }
  specify { subject[:nb].should == 5 }
end
