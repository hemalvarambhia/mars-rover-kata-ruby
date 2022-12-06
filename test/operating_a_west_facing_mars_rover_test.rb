require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'
class OperatingAWestFacingMarsRoverTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_one_step_forward_from_the_origin
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 2, y: 2), orientation: 'W')

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 2), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 2, y: 2), orientation: 'W')

    mars_rover.execute('f')

    assert_equal('W', mars_rover.orientation)
  end

  def test_moving_one_step_backwards_from_any_position
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), orientation: 'W')

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 1, y: 0), mars_rover)
  end

  def test_turning_mars_rover_left_orients_it_southward
    skip('Test list')
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    skip('Test list')
  end

  def test_turning_mars_rover_right_orients_it_northward
    skip('Test list')
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    skip('Test list')
  end
end
