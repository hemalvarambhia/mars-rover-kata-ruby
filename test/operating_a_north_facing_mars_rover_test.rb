require 'minitest/autorun'
require_relative '../lib/mars_rover'
require_relative '../lib/coordinates'
class OperatingANorthFacingMarsRoverTest < Minitest::Test
  def test_no_command_moves_mars_rover_nowhere
    skip('Test list')

    assert_located_at(Coordinates.new(x: 0, y: 0), mars_rover)
  end

  def test_moving_one_step_forward_from_the_origin
    skip('Test list')
  end

  def test_moving_forward_leaves_direction_unchanged
    skip('Test list')
  end

  def test_moving_one_step_backwards_from_any_position
    skip('Test list')
  end

  def test_turning_mars_rover_left_orients_it_westward
    skip('Test list')
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    skip('Test list')
  end

  def test_turning_mars_rover_right_orients_it_eastward
    skip('Test list')
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    skip('Test list')
  end

  def test_an_unsupported_command_does_nothing_to_the_mars_rover
    skip('Test list')
  end

  def test_moving_the_mars_rover_two_steps_backwards
    skip('Test list')
  end
end
