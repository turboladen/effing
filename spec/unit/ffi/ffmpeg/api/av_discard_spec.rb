require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_discard'


describe 'FFI::FFmpeg::AVDiscard' do
  subject { FFI::FFmpeg::AVDiscard }

  specify { subject[:none].should == -16 }
  specify { subject[:default].should == 0 }
  specify { subject[:nonref].should == 8 }
  specify { subject[:bidir].should == 16 }
  specify { subject[:nonkey].should == 32 }
  specify { subject[:all].should == 48 }
end
