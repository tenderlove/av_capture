require 'minitest/autorun'
require 'maccam'

class TestMaccam < MiniTest::Unit::TestCase
  def test_output
    sio = AVCapture::StillImageOutput.new
    assert_equal 0, sio.connections.length
  end

  def test_connect
    sio = AVCapture::StillImageOutput.new
    assert_equal 0, sio.connections.length
    assert sio.connect AVCapture::AVMediaTypeVideo
    assert_equal 1, sio.connections.length
  end
end
