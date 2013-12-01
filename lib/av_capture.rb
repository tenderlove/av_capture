require 'av_capture.so'

module AVCapture
  class Device
    def video?
      has_media_type? AVCapture::AVMediaTypeVideo
    end
  end
end
