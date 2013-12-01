require 'minitest/autorun'
require 'maccam'

class TestMaccam < MiniTest::Test
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
    dev     = AVCapture.devices[1]
    input   = AVCapture::DeviceInput.new dev
    assert session.can_add_input?(input)
    session.add_input input
  end

  def test_add_io
    session = AVCapture::Session.new
    dev     = AVCapture.devices[1]
    input   = AVCapture::DeviceInput.new dev
    output  = AVCapture::StillImageOutput.new
    session.add_input input
    session.add_output output
    assert_equal 1, output.connections.length
  end

  def test_captureStillImageAsynchronouslyFromConnection
    session = AVCapture::Session.new
    dev     = AVCapture.devices[1]
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
end
