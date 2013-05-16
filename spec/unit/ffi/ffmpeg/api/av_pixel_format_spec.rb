require 'spec_helper'
require 'ffi/ffmpeg'
require 'ffi/ffmpeg/api/av_pixel_format'


describe 'FFI::FFmpeg::AVPixelFormat' do
  subject { FFI::FFmpeg::AVPixelFormat }

  specify { subject[:none].should             == -1 }
  specify { subject[:yuv420p].should          == 0 }
  specify { subject[:yuyv422].should          == 1 }
  specify { subject[:rgb24].should            == 2 }
  specify { subject[:bgr24].should            == 3 }
  specify { subject[:yuv422p].should          == 4 }
  specify { subject[:yuv444p].should          == 5 }
  specify { subject[:yuv410p].should          == 6 }
  specify { subject[:yuv411p].should          == 7 }
  specify { subject[:gray8].should            == 8 }
  specify { subject[:monowhite].should        == 9 }
  specify { subject[:monoblack].should        == 10 }
  specify { subject[:pal8].should             == 11 }
  specify { subject[:yuvj420p].should         == 12 }
  specify { subject[:yuvj422p].should         == 13 }
  specify { subject[:yuvj444p].should         == 14 }
  specify { subject[:xvmc_mpeg2_mc].should    == 15 }
  specify { subject[:xvmc_mpeg2_idct].should  == 16 }
  specify { subject[:uyvy422].should          == 17 }
  specify { subject[:uyyvyy411].should        == 18 }
  specify { subject[:bgr8].should             == 19 }
  specify { subject[:bgr4].should             == 20 }
  specify { subject[:bgr4_byte].should        == 21 }
  specify { subject[:rgb8].should             == 22 }
  specify { subject[:rgb4].should             == 23 }
  specify { subject[:rgb4_byte].should        == 24 }
  specify { subject[:nv12].should             == 25 }
  specify { subject[:nv21].should             == 26 }

  specify { subject[:argb].should == 27 }
  specify { subject[:rgba].should == 28 }
  specify { subject[:abgr].should == 29 }
  specify { subject[:bgra].should == 30 }

  specify { subject[:gray16be].should     == 31 }
  specify { subject[:gray16le].should     == 32 }
  specify { subject[:yuv440p].should      == 33 }
  specify { subject[:yuvj440p].should     == 34 }
  specify { subject[:yuva420p].should     == 35 }
  specify { subject[:vdpau_h264].should   == 36 }
  specify { subject[:vdpau_mpeg1].should  == 37 }
  specify { subject[:vdpau_mpeg2].should  == 38 }
  specify { subject[:vdpau_wmv3].should   == 39 }
  specify { subject[:vdpau_vc1].should    == 40 }

  specify { subject[:rgb44be].should  == 41 }
  specify { subject[:rgb44le].should  == 42 }
  specify { subject[:rgb565be].should == 43 }
  specify { subject[:rgb565le].should == 44 }
  specify { subject[:rgb555be].should == 45 }
  specify { subject[:rgb555le].should == 46 }
  specify { subject[:bgr565be].should == 47 }
  specify { subject[:bgr565le].should == 48 }
  specify { subject[:bgr555be].should == 49 }
  specify { subject[:bgr555le].should == 50 }

  specify { subject[:vaapi_moco].should == 51 }
  specify { subject[:vaapi_idct].should == 52 }
  specify { subject[:vaapi_vld].should  == 53 }

  specify { subject[:yuv420p16le].should  == 54 }
  specify { subject[:yuv420p16be].should  == 55 }
  specify { subject[:yuv422p16le].should  == 56 }
  specify { subject[:yuv422p16be].should  == 57 }
  specify { subject[:yuv444p16le].should  == 58 }
  specify { subject[:yuv444p16be].should  == 59 }
  specify { subject[:vdpau_mpeg4].should  == 60 }
  specify { subject[:dxva2_vld].should    == 61 }

  specify { subject[:rgb444le].should == 62 }
  specify { subject[:rgb444be].should == 63 }
  specify { subject[:bgr444le].should == 64 }
  specify { subject[:bgr444be].should == 65 }
  specify { subject[:gray8a].should   == 66 }
  specify { subject[:bgr48be].should  == 67 }
  specify { subject[:bgr48le].should  == 68 }

  specify { subject[:yuv420p9be].should   == 69 }
  specify { subject[:yuv420p9le].should   == 70 }
  specify { subject[:yuv420p10be].should  == 71 }
  specify { subject[:yuv420p10le].should  == 72 }
  specify { subject[:yuv422p10be].should  == 73 }
  specify { subject[:yuv422p10le].should  == 74 }
  specify { subject[:yuv444p9be].should   == 75 }
  specify { subject[:yuv444p9le].should   == 76 }
  specify { subject[:yuv444p10be].should  == 77 }
  specify { subject[:yuv444p10le].should  == 78 }
  specify { subject[:yuv422p9be].should   == 79 }
  specify { subject[:yuv422p9le].should   == 80 }

  specify { subject[:vda_vld].should  == 81 }
  specify { subject[:gbrp].should     == 82 }
  specify { subject[:gbrp9be].should  == 83 }
  specify { subject[:gbrp9le].should  == 84 }
  specify { subject[:gbrp10be].should == 85 }
  specify { subject[:gbrp10le].should == 86 }
  specify { subject[:gbrp16be].should == 87 }
  specify { subject[:gbrp16le].should == 88 }

  specify { subject[:yuva422p_libav].should == 89 }
  specify { subject[:yuva444p_libav].should == 90 }

  specify { subject[:yuva420p9be].should == 91 }
  specify { subject[:yuva420p9le].should == 92 }
  specify { subject[:yuva422p9be].should == 93 }
  specify { subject[:yuva422p9le].should == 94 }
  specify { subject[:yuva444p9be].should == 95 }
  specify { subject[:yuva444p9le].should == 96 }

  specify { subject[:yuva420p10be].should == 97 }
  specify { subject[:yuva420p10le].should == 98 }
  specify { subject[:yuva422p10be].should == 99 }
  specify { subject[:yuva422p10le].should == 100 }
  specify { subject[:yuva444p10be].should == 101 }
  specify { subject[:yuva444p10le].should == 102 }

  specify { subject[:yuva420p16be].should == 103 }
  specify { subject[:yuva420p16le].should == 104 }
  specify { subject[:yuva422p16be].should == 105 }
  specify { subject[:yuva422p16le].should == 106 }
  specify { subject[:yuva444p16be].should == 107 }
  specify { subject[:yuva444p16le].should == 108 }

  specify { subject[:vdpau].should == 109 }

  specify { subject[:xyz12le].should == 110 }
  specify { subject[:xyz12be].should == 111 }

  specify { subject[:rgba64be].should == 112 }
  specify { subject[:rgba64le].should == 113 }
  specify { subject[:bgra64be].should == 114 }
  specify { subject[:bgra64le].should == 115 }

  specify { subject[:zerorgb].should  == 116 }
  specify { subject[:rgb0].should     == 117 }
  specify { subject[:zerobgr].should  == 118 }
  specify { subject[:bgr0].should     == 119 }
  specify { subject[:yuva444p].should == 120 }
  specify { subject[:yuva422p].should == 121 }

  specify { subject[:yuv420p12be].should == 122 }
  specify { subject[:yuv420p12le].should == 123 }
  specify { subject[:yuv420p14be].should == 124 }
  specify { subject[:yuv420p14le].should == 125 }
  specify { subject[:yuv422p12be].should == 126 }
  specify { subject[:yuv422p12le].should == 127 }
  specify { subject[:yuv422p14be].should == 128 }
  specify { subject[:yuv422p14le].should == 129 }
  specify { subject[:yuv444p12be].should == 130 }
  specify { subject[:yuv444p12le].should == 131 }
  specify { subject[:yuv444p14be].should == 132 }
  specify { subject[:yuv444p14le].should == 133 }

  specify { subject[:gbrp12be].should == 134 }
  specify { subject[:gbrp12le].should == 135 }
  specify { subject[:gbrp14be].should == 136 }
  specify { subject[:gbrp14le].should == 137 }

  specify { subject[:nb].should == 138 }
end
