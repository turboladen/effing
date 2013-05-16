require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_packet_side_data_type'


describe 'FFI::FFmpeg::AVPacketSideDataType' do
  subject { FFI::FFmpeg::AVPacketSideDataType }

  specify { subject[:palette].should           == 0 }
  specify { subject[:new_extradata].should     == 1 }
  specify { subject[:param_change].should      == 2 }
  specify { subject[:h263_mb_info].should      == 3 }
  specify { subject[:skip_samples].should      == 70 }
  specify { subject[:jp_dualmono].should       == 71 }
  specify { subject[:strings_metadata].should  == 72 }
  specify { subject[:subtitle_position].should == 73 }
end
