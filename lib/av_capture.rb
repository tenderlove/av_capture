require 'av_capture.so'
require 'thread'

module AVCapture
  VERSION = '1.0.0'

  class Device
    def video?
      has_media_type? AVCapture::AVMediaTypeVideo
    end

    def as_input
      AVCapture::DeviceInput.new self
    end
  end

  class ImagePromise
    def initialize io
      @io    = io
      @data  = nil
      @mutex = Mutex.new
    end

    def to_io; @io; end

    def data
      @data || @mutex.synchronize do
        @data ||= @io.read.tap { @io.close }
      end
    end
    alias :read :data
  end

  class StillImageOutput
    def video_connection
      connect AVCapture::AVMediaTypeVideo
    end

    def capture_on connection
      ImagePromise.new IO.new capture_still_image connection
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
