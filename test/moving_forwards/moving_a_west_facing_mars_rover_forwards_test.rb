require 'minitest/autorun'
require_relative '../mars_rover_in_cartesian_coordinate_system'
class MovingAWestFacingMarsRoverForwardsTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_one_step_forward_from_the_origin
    planet = TorusShapedPlanet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = west_facing_mars_rover(planet, Coordinates.new(x: 2, y: 2))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 2), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    planet = TorusShapedPlanet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = west_facing_mars_rover(planet, Coordinates.new(x: 2, y: 2))

    mars_rover.execute('f')

    assert_equal('W', mars_rover.orientation)
  end

  def test_moving_forward_from_the_western_edge
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 7, southern_edge: nil, western_edge: -7)
    mars_rover = west_facing_mars_rover(planet, Coordinates.new(x: -7, y: -1))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 7, y: -1), mars_rover)
  end

  def test_moving_forward_past_the_western_edge
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 7, southern_edge: nil, western_edge: -7)
    mars_rover = west_facing_mars_rover(planet, Coordinates.new(x: -5, y: -1))

    mars_rover.execute('ffff')

    assert_located_at(Coordinates.new(x: 6, y: -1), mars_rover)
  end

  private

  def west_facing_mars_rover(planet, starting_position)
    mars_rover = MarsRover.new(planet: planet, starting_position: starting_position, orientation: 'W')
    VehicleController.new(vehicle: mars_rover)
  end
end
