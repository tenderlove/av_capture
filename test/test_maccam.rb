require 'minitest/autorun'
require 'maccam'

class TestMaccam < MiniTest::Unit::TestCase
  def test_output
    sio = AVCapture::StillImageOutput.new
    assert_equal 0, sio.connections.length
  end
end
