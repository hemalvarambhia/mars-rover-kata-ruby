require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'

class OperatingAnEastFacingMarsRoverTest < Minitest::Test
  include CoordinatesAssertion

  def test_no_command_moves_mars_rover_nowhere
    mars_rover = mars_rover_oriented_eastward(Coordinates.new(x: 0, y: 0))

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 0, y: 0), mars_rover)
  end

  def test_no_command_leaves_mars_rovers_current_position_unchanged
    mars_rover = mars_rover_oriented_eastward(Coordinates.new(x: 2, y: 1))

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 2, y: 1), mars_rover)
  end

  def test_moving_one_step_forward_from_the_origin
    mars_rover = mars_rover_oriented_eastward(Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 0), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    mars_rover = mars_rover_oriented_eastward(Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_equal('E', mars_rover.orientation)
  end

  def test_moving_one_step_backwards_from_any_position
    mars_rover = mars_rover_oriented_eastward(Coordinates.new(x: 3, y: 5))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 2, y: 5), mars_rover)
  end

  def test_turning_mars_rover_left_orients_it_northward
    mars_rover = mars_rover_oriented_eastward(nil)

    mars_rover.execute('l')

    assert_equal('N', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    mars_rover = mars_rover_oriented_eastward(Coordinates.new(x: 5, y: -2))

    mars_rover.execute('l')

    assert_located_at(Coordinates.new(x: 5, y: -2), mars_rover)
  end

  def test_turning_mars_rover_right_orients_it_southward
    mars_rover = mars_rover_oriented_eastward(nil)

    mars_rover.execute('r')

    assert_equal('S', mars_rover.orientation, 'orientation')
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    mars_rover = mars_rover_oriented_eastward(Coordinates.new(x: 0, y: 3))

    mars_rover.execute('r')

    assert_located_at(Coordinates.new(x: 0, y: 3), mars_rover)
  end

  def test_an_unsupported_command_does_nothing_to_the_mars_rover
    mars_rover = mars_rover_oriented_eastward(Coordinates.new(x: 3, y: 2))

    mars_rover.execute('u')

    assert_located_at(Coordinates.new(x: 3, y: 2), mars_rover)
  end

  def test_moving_the_mars_rover_two_steps_forward
    mars_rover = mars_rover_oriented_eastward(Coordinates.new(x: 0, y: 2))

    mars_rover.execute('ff')

    assert_located_at(Coordinates.new(x: 2, y: 2), mars_rover)
  end

  private

  def mars_rover_oriented_eastward(starting_position)
    mars_rover = MarsRover.new(starting_position: starting_position, orientation: 'E')
    VehicleController.new(vehicle: mars_rover)
  end
end