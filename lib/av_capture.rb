require 'av_capture.so'

module AVCapture
  class Device
    def video?
      has_media_type? AVCapture::AVMediaTypeVideo
    end
  end

  class Session
    def run
      start_running!
      yield
    ensure
      stop_running!
    end
  end
end
