require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_audio_service_type'


describe 'FFI::FFmpeg::AVAudioServiceType' do
  subject { FFI::FFmpeg::AVAudioServiceType }

  it 'defines an enum' do
    subject.should be_a FFI::Enum
  end

  it 'uses default enum values' do
    subject[:main].should == 0
    subject[:effects].should == 1
    subject[:visually_impaired].should == 2
    subject[:hearing_impaired].should == 3
    subject[:dialogue].should == 4
    subject[:commentary].should == 5
    subject[:emergency].should == 6
    subject[:voice_over].should == 7
    subject[:karaoke].should == 8
    subject[:nb].should == 9
  end
end
