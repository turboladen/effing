require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_duration_estimation_method'


describe 'FFI::FFmpeg::AVDurationEstimationMethod' do
  subject { FFI::FFmpeg::AVDurationEstimationMethod }

  specify { subject[:pts].should == 0 }
  specify { subject[:stream].should == 1 }
  specify { subject[:bitrate].should == 2 }
end
