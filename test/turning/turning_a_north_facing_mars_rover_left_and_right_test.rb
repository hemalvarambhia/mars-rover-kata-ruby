require 'minitest/autorun'
require_relative '../mars_rover_in_cartesian_coordinate_system'
class TurningANorthFacingMarsRoverLeftAndRightTest < Minitest::Test
  include CoordinatesAssertion

  def test_turning_mars_rover_left_orients_it_westward
    mars_rover = mars_rover(nil, nil)

    mars_rover.execute('l')

    assert_equal('W', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    planet = TorusShapedPlanet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover(planet, Coordinates.new(x: 2, y: 2))

    mars_rover.execute('l')

    assert_located_at(Coordinates.new(x: 2, y: 2), mars_rover)
  end

  def test_turning_mars_rover_right_orients_it_eastward
    planet = TorusShapedPlanet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover(nil, nil)

    mars_rover.execute('r')

    assert_equal('E', mars_rover.orientation)
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    planet = TorusShapedPlanet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover(planet, Coordinates.new(x: 1, y: 2))

    mars_rover.execute('r')

    assert_located_at(Coordinates.new(x: 1, y: 2), mars_rover)
  end

  private

  def mars_rover(planet, starting_position)
    mars_rover = MarsRover.new(planet: planet, starting_position: starting_position, orientation: 'N')
    VehicleController.new(vehicle: mars_rover)
  end
end
