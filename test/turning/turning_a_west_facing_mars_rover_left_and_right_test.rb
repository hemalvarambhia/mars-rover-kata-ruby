require 'minitest/autorun'
require_relative '../mars_rover_in_cartesian_coordinate_system'
class TurningAWestFacingMarsRoverLeftAndRightTest < Minitest::Test
  include CoordinatesAssertion

  def test_turning_mars_rover_left_orients_it_southward
    mars_rover = mars_rover(nil, nil)

    mars_rover.execute('l')

    assert_equal('S', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    mars_rover = mars_rover(nil, Coordinates.new(x: 1, y: 3))

    mars_rover.execute('l')

    assert_located_at(Coordinates.new(x: 1, y: 3), mars_rover)
  end

  def test_turning_mars_rover_right_orients_it_northward
    mars_rover = mars_rover(nil, nil)

    mars_rover.execute('r')

    assert_equal('N', mars_rover.orientation)
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    mars_rover = mars_rover(nil, Coordinates.new(x: -1, y: -3))

    mars_rover.execute('r')

    assert_located_at(Coordinates.new(x: -1, y: -3), mars_rover)
  end

  private

  def mars_rover(planet, starting_position)
    mars_rover = MarsRover.new(planet: planet, starting_position: starting_position, orientation: 'W')
    VehicleController.new(vehicle: mars_rover)
  end
end
