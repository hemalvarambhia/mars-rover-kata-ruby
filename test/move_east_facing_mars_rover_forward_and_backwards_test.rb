require 'minitest/autorun'
require_relative '../lib/mars_rover'
class MoveEastFacingMarsRoverForwardAndBackwardsTest < Minitest::Test
  def test_failing_hookup
    assert_equal(4, 2 + 2)
  end

  def test_no_command_moves_mars_rover_nowhere
    mars_rover = MarsRover.new
    mars_rover.execute('')

    assert_equal(0, mars_rover.x, "x-coordinate")
    assert_equal(0, mars_rover.y, "y-coordinate")
  end

  def test_moving_one_step_forward_from_the_origin
    skip('Test list')
  end

  def test_moving_one_step_forward_from_any_position
    skip('Test list')
  end
end