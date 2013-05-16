require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_stream_parse_type'


describe 'FFI::FFmpeg::AVStreamParseType' do
  subject { FFI::FFmpeg::AVStreamParseType }

  specify { subject[:none].should       == 0 }
  specify { subject[:full].should       == 1 }
  specify { subject[:headers].should    == 2 }
  specify { subject[:timestamps].should == 3 }
  specify { subject[:full_once].should  == 4 }
  specify { subject[:full_raw].should   == 5 }
end
