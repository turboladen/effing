require_relative 'base_frame'


class Effing

  # Frame type to be used for audio frames.
  class AudioFrame < BaseFrame
    include LogSwitch::Mixin
  end
end
