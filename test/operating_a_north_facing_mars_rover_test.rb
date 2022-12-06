require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'
class OperatingANorthFacingMarsRoverTest < Minitest::Test
  include CoordinatesAssertion

  def test_no_command_moves_mars_rover_nowhere
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 0, y: 0))

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 0, y: 0), mars_rover)
  end

  def test_moving_one_step_forward_from_the_origin
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 0, y: 1), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: -1, y: -2))

    mars_rover.execute('f')

    assert_equal('N', mars_rover.orientation)
  end

  def test_moving_one_step_backwards_from_any_position
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 2, y: 1))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 2, y: 0), mars_rover)
  end

  def test_moving_backwards_leaves_orientation_unchanged
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 0, y: 1))

    mars_rover.execute('b')

    assert_equal('N', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_orients_it_westward
    mars_rover = mars_rover_oriented_northward(nil)

    mars_rover.execute('l')

    assert_equal('W', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 2, y: 2))

    mars_rover.execute('l')

    assert_located_at(Coordinates.new(x: 2, y: 2), mars_rover)
  end

  def test_turning_mars_rover_right_orients_it_eastward
    mars_rover = mars_rover_oriented_northward(nil)

    mars_rover.execute('r')

    assert_equal('E', mars_rover.orientation)
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 1, y: 2))

    mars_rover.execute('r')

    assert_located_at(Coordinates.new(x: 1, y: 2), mars_rover)
  end

  def test_an_unsupported_command_does_nothing_to_the_mars_rover
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 4, y: 1))

    mars_rover.execute('x')

    assert_located_at(Coordinates.new(x: 4, y: 1), mars_rover)
  end

  def test_moving_the_mars_rover_two_steps_backwards
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 2, y: -2))

    mars_rover.execute('bb')

    assert_located_at(Coordinates.new(x: 2, y: -4), mars_rover)
  end

  private

  def mars_rover_oriented_northward(starting_position)
    MarsRover.new(starting_position: starting_position, orientation: 'N')
  end
end
