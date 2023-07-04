require 'minitest/autorun'
require_relative '../mars_rover_in_cartesian_coordinate_system'
class MovingAWestFacingMarsRoverBackwardsTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_one_step_backwards_from_any_position
    planet = TorusShapedPlanet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('b')

    expected_location = Coordinates.new(x: 1, y: 0)
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_backwards_from_the_eastern_edge
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 4, southern_edge: nil, western_edge: -4)
    mars_rover = mars_rover(planet, Coordinates.new(x: 4, y: 0))

    mars_rover.execute('b')

    expected_location = Coordinates.new(x: -4, y: 0)
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_backwards_past_the_eastern_edge
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -4)
    mars_rover = mars_rover(planet, Coordinates.new(x: 3, y: 0))

    mars_rover.execute('bbbb')

    expected_location = Coordinates.new(x: -3, y: 0)
    assert_located_at(expected_location, mars_rover)
  end

  private

  def mars_rover(planet, starting_position)
    mars_rover = MarsRover.new(planet: planet, starting_position: starting_position, orientation: 'W')
    VehicleController.new(vehicle: mars_rover)
  end
end
