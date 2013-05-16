require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_field_order'


describe 'FFI::FFmpeg::AVFieldOrder' do
  subject { FFI::FFmpeg::AVFieldOrder }

  specify { subject[:unknown].should == 0 }
  specify { subject[:progressive].should == 1 }
  specify { subject[:tt].should == 2 }
  specify { subject[:bb].should == 3 }
  specify { subject[:tb].should == 4 }
  specify { subject[:bt].should == 5 }
end
