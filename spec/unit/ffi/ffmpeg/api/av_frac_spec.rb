require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_frac'


describe FFI::FFmpeg::AVFrac do
  context 'defaults' do
    specify { subject[:val].should == 0 }
    specify { subject[:num].should == 0 }
    specify { subject[:den].should == 0 }
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
        subject.to_i.should == 2
      end
    end
  end

  describe '#to_s' do
    specify {
      subject.to_s.should match %r[#<AVRational:\w{18} val=0, num=0, den=0, NaN>]
    }
  end
end
