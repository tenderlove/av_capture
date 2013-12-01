require 'minitest/autorun'
require 'av_capture'

class TestAVCapture < MiniTest::Test
  def device
    AVCapture.devices.find(&:video?)
  end

  def test_output
    sio = AVCapture::StillImageOutput.new
    assert_equal 0, sio.connections.length
  end

  def test_session
    session = AVCapture::Session.new
    sio = AVCapture::StillImageOutput.new
    assert session.can_add_output?(sio)
    session.add_output sio
  end

  def test_add_input
    session = AVCapture::Session.new
    dev     = device
    input   = AVCapture::DeviceInput.new dev
    assert session.can_add_input?(input)
    session.add_input input
  end

  def test_as_input
    assert_kind_of AVCapture::DeviceInput, device.as_input
  end

  def test_add_io
    session = AVCapture::Session.new
    dev     = device
    input   = AVCapture::DeviceInput.new dev
    output  = AVCapture::StillImageOutput.new
    session.add_input input
    session.add_output output
    assert_equal 1, output.connections.length
  end

  def test_video_connection
    session = AVCapture::Session.new
    dev     = device
    input   = AVCapture::DeviceInput.new dev
    output  = AVCapture::StillImageOutput.new
    session.add_input input
    session.add_output output

    assert_kind_of AVCapture::Connection, output.video_connection
  end

  def test_captureStillImageAsynchronouslyFromConnection
    session = AVCapture::Session.new
    dev     = device
    input   = AVCapture::DeviceInput.new dev
    output  = AVCapture::StillImageOutput.new
    session.add_input input
    session.add_output output

    connection = output.connect AVCapture::AVMediaTypeVideo

    session.start_running!
    pipe_fd = output.capture_still_image connection
    io = IO.new pipe_fd
    IO.select([io])
    assert io.read
    io.close
    session.stop_running!
  end

  def test_capture_on
    session = AVCapture::Session.new
    dev     = device
    output  = AVCapture::StillImageOutput.new
    session.add_input dev.as_input
    session.add_output output

    session.run do
      connection = output.video_connection
      pic = output.capture_on connection
      assert pic.data
    end
  end

  def test_select_on_pic
    session = AVCapture::Session.new
    dev     = device
    output  = AVCapture::StillImageOutput.new
    session.add_input dev.as_input
    session.add_output output

    session.run do
      connection = output.video_connection
      pic = output.capture_on connection
      rd, = IO.select([pic])
      assert rd.first.read
    end
  end

  def test_runblock
    actions = []
    klass = Class.new(AVCapture::Session) do
      define_method(:start_running!) {
        actions << :start_running
      }
      define_method(:stop_running!) {
        actions << :stop_running
      }
    end
    session = klass.new
    session.run { actions << :run }
    assert_equal [:start_running, :run, :stop_running], actions
  end
end
