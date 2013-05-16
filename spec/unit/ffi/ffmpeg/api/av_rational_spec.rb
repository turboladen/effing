require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_rational'


describe FFI::FFmpeg::AVRational do
  context 'defaults' do
    describe 'num' do
      specify { subject[:num].should == 0 }
    end

    describe 'den' do
      specify { subject[:den].should == 0 }
    end
  end

  describe '#to_f' do
    it 'returns a Float' do
      subject.to_f.should be_a Float
    end
  end

  describe '#to_i' do
    context ':den is 0' do
      it 'returns a Integer' do
        expect { subject.to_i }.to raise_error ZeroDivisionError
      end
    end

    context ':den is not 0' do
      before do
        subject.stub(:[]).and_return 1
      end

      it 'returns a Integer' do
        subject.to_i.should == 1
      end
    end
  end

  describe '#to_s' do
    specify {
      subject.to_s.should match %r[#<FFI::FFmpeg::AVRational:\w{18} num=0, den=0, NaN>]
    }
  end
end
