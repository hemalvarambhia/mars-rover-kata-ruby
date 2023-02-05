require 'minitest/autorun'
require_relative '../mars_rover_in_cartesian_coordinate_system'
class MovingASouthFacingMarsRoverForwardsTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_one_step_forward_from_the_origin
    planet = TorusShapedPlanet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 0, y: -1), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    planet = TorusShapedPlanet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_equal('S', mars_rover.orientation)
  end

  def test_moving_forwards_from_the_southern_edge
    planet = TorusShapedPlanet.new(northern_edge: 4, eastern_edge: nil, southern_edge: -4, western_edge: nil)
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 0, y: -4))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 0, y: 4), mars_rover)
  end

  def test_moving_forwards_past_the_southern_edge
    planet = TorusShapedPlanet.new(northern_edge: 4, eastern_edge: nil, southern_edge: -4, western_edge: nil)
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 0, y: -3))

    mars_rover.execute('fff')

    assert_located_at(Coordinates.new(x: 0, y: 3), mars_rover)
  end

  def test_mars_rover_cannot_move_forwards_when_obstacle_is_in_front
    planet = TorusShapedPlanet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil, obstacles: [Coordinates.new(x: 1, y: -2)])
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 1, y: -1))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: -1), mars_rover)
  end

  def test_mars_rover_can_move_forward_up_to_an_obstacle_and_not_beyond
    planet = TorusShapedPlanet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil, obstacles: [Coordinates.new(x: 1, y: -6)])
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 1, y: 0))

    mars_rover.execute('ffffff')

    assert_located_at(Coordinates.new(x: 1, y: -5), mars_rover)
  end

  def test_mars_rover_cannot_move_past_southern_edge_when_obstacle_is_located_on_northern_edge
    planet = TorusShapedPlanet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil, obstacles: [Coordinates.new(x: -1, y: 6)])
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: -1, y: -6))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: -1, y: -6), mars_rover)
  end

  private

  def south_facing_mars_rover(planet, starting_position)
    mars_rover = MarsRover.new(planet: planet, starting_position: starting_position, orientation: 'S')
    VehicleController.new(vehicle: mars_rover)
  end
end
