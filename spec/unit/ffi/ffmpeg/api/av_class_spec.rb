require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_class'


describe FFI::FFmpeg::AVClass do
  subject do
    FFI::FFmpeg::AVClass.new
  end

  context 'default values' do
    describe 'class_name' do
      specify { subject[:class_name].should be_nil }
    end

    describe 'item_name' do
      specify { subject[:item_name].should be_a FFI::Pointer }
      specify { subject[:item_name].address.should == 0 }
    end

    describe 'option' do
      specify { subject[:option].should be_a FFI::FFmpeg::AVOption }
    end

    describe 'version' do
      specify { subject[:version].should == 0 }
    end

    describe 'log_level_offset_offset' do
      specify { subject[:log_level_offset_offset].should == 0 }
    end

    describe 'parent_log_content_offset' do
      specify { subject[:parent_log_content_offset].should == 0 }
    end

    describe 'child_next' do
      specify { subject[:child_next].should be_a FFI::Pointer }
      specify { subject[:child_next].address.should == 0 }
    end

    describe 'child_class_next' do
      specify { subject[:child_class_next].should be_a FFI::Pointer }
      specify { subject[:child_class_next].address.should == 0 }
    end

    describe 'category' do
      specify { subject[:category].should == :na }
    end

    describe 'get_category' do
      specify { subject[:get_category].should be_a FFI::Pointer }
      specify { subject[:get_category].address.should == 0 }
    end

    describe 'query_ranges' do
      specify { subject[:query_ranges].should be_a FFI::Pointer }
      specify { subject[:query_ranges].address.should == 0 }
    end
  end
end
