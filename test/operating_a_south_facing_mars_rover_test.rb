require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'
class OperatingASouthFacingMarsRoverTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_one_step_forward_from_the_origin
    mars_rover = south_facing_mars_rover(Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 0, y: -1), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    mars_rover = south_facing_mars_rover(Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_equal('S', mars_rover.orientation)
  end

  def test_moving_one_step_backwards_from_any_position
    mars_rover = south_facing_mars_rover(Coordinates.new(x: 1, y: 1))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 1, y: 2), mars_rover)
  end

  def test_moving_backwards_leaves_orientation_unchanged
    mars_rover = south_facing_mars_rover(Coordinates.new(x: -2, y: -2))

    mars_rover.execute('b')

    assert_equal('S', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_orients_it_eastward
    mars_rover = south_facing_mars_rover(nil)

    mars_rover.execute('l')

    assert_equal('E', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    mars_rover = south_facing_mars_rover(Coordinates.new(x: 1, y: 2))

    mars_rover.execute('l')

    assert_located_at(Coordinates.new(x: 1, y: 2), mars_rover)
  end

  def test_turning_mars_rover_right_orients_it_westward
    mars_rover = south_facing_mars_rover(nil)

    mars_rover.execute('r')

    assert_equal('W', mars_rover.orientation)
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    mars_rover = south_facing_mars_rover(Coordinates.new(x: -2, y: 1))

    mars_rover.execute('r')

    assert_located_at(Coordinates.new(x: -2, y: 1), mars_rover)
  end

  def test_an_unsupported_command_does_nothing_to_the_mars_rover
    mars_rover = south_facing_mars_rover(Coordinates.new(x: 2, y: -1))

    mars_rover.execute('x')

    assert_located_at(Coordinates.new(x: 2, y: - 1), mars_rover)
    assert_equal('S', mars_rover.orientation)
  end

  private

  def south_facing_mars_rover(starting_point)
    MarsRover.south_facing(starting_position: starting_point)
  end
end
