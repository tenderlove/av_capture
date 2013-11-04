require 'minitest/autorun'
require 'maccam'

class TestMaccam < MiniTest::Unit::TestCase
  def test_output
    sio = AVCapture::StillImageOutput.new
    assert_equal 0, sio.connections.length
  end

  def test_connect
    skip "not working yet"
    sio = AVCapture::StillImageOutput.new
    assert_equal 0, sio.connections.length
    assert sio.connect AVCapture::AVMediaTypeVideo
    assert_equal 1, sio.connections.length
  end

  def test_session
    session = AVCapture::Session.new
    sio = AVCapture::StillImageOutput.new
    assert session.can_add_output?(sio)
    session.add_output sio
  end
end
