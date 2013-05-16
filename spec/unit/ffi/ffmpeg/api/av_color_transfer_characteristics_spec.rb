require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_color_transfer_characteristic'


describe 'FFI::FFmepg::AVColorTransferCharacteristic' do
  subject { FFI::FFmpeg::AVColorTransferCharacteristic }

  specify { subject[:bt709].should == 1 }
  specify { subject[:unspecified].should == 2 }
  specify { subject[:gamma22].should == 4 }
  specify { subject[:gamma28].should == 5 }
  specify { subject[:smpte240m].should == 7 }
  specify { subject[:nb].should == 8 }
end
