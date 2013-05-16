require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_option'


describe FFI::FFmpeg::DefaultVal do
  context 'defaults' do
    describe 'i64' do
      specify { subject[:i64].should == 0 }
    end

    describe 'dbl' do
      specify { subject[:dbl].should == 0 }
    end

    describe 'str' do
      specify { subject[:str].should be_nil }
    end

    describe 'q' do
      specify { subject[:q].should be_a FFI::FFmpeg::AVRational }
    end
  end
end

describe FFI::FFmpeg::AVOption do
  context 'defaults' do
    describe 'name' do
      specify { subject[:name].should be_nil }
    end

    describe 'help' do
      specify { subject[:help].should be_nil }
    end

    describe 'offset' do
      specify { subject[:offset].should == 0 }
    end

    describe 'type' do
      specify { subject[:type].should == :flags }
    end

    describe 'default_val' do
      specify { subject[:default_val].should be_a FFI::FFmpeg::DefaultVal }
    end

    describe 'min' do
      specify { subject[:min].should == 0 }
    end

    describe 'max' do
      specify { subject[:max].should == 0 }
    end

    describe 'flags' do
      specify { subject[:flags].should == 0 }
    end

    describe 'unit' do
      specify { subject[:unit].should be_nil }
    end
  end
end
