require 'minitest/autorun'
require_relative '../mars_rover_in_cartesian_coordinate_system'
class MovingASouthFacingMarsRoverBackwardsTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_one_step_backwards_from_any_position
    planet = TorusBasedPlanet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 1, y: 1))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 1, y: 2), mars_rover)
  end

  def test_moving_backwards_leaves_orientation_unchanged
    planet = TorusBasedPlanet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: -2, y: -2))

    mars_rover.execute('b')

    assert_equal('S', mars_rover.orientation)
  end

  def test_an_unsupported_command_does_nothing_to_the_mars_rover
    mars_rover = south_facing_mars_rover(nil, Coordinates.new(x: 2, y: -1))

    mars_rover.execute('x')

    assert_located_at(Coordinates.new(x: 2, y: - 1), mars_rover)
    assert_equal('S', mars_rover.orientation)
  end

  def test_moving_backwards_from_the_northern_edge
    planet = TorusBasedPlanet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 0, y: 5))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 0, y: -5), mars_rover)
  end

  def test_moving_backwards_past_the_northern_edge
    planet = TorusBasedPlanet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil)
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 0, y: 4))

    mars_rover.execute('bbbb')

    assert_located_at(Coordinates.new(x: 0, y: -5), mars_rover)
  end

  def test_mars_rover_cannot_move_backwards_when_obstacle_is_behind_it
    planet = TorusBasedPlanet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil, obstacles: [Coordinates.new(x: -1, y: -3)])
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: -1, y: -4))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: -1, y: -4), mars_rover)
  end

  def test_mars_rover_cannot_move_backwards_up_to_an_obstacle_and_not_beyond
    planet = TorusBasedPlanet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil, obstacles: [Coordinates.new(x: 3, y: 1)])
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 3, y: -3))

    mars_rover.execute('bbbbb')

    assert_located_at(Coordinates.new(x: 3, y: 0), mars_rover)
  end

  def test_mars_rover_cannot_move_past_northern_edge_when_obstacle_is_located_on_southern_edge
    planet = TorusBasedPlanet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil, obstacles: [Coordinates.new(x: 0, y: -5)])
    mars_rover = south_facing_mars_rover(planet, Coordinates.new(x: 0, y: 5))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 0, y: 5), mars_rover)
  end

  private

  def south_facing_mars_rover(planet, starting_position)
    mars_rover = MarsRover.new(planet: planet, starting_position: starting_position, orientation: 'S')
    VehicleController.new(vehicle: mars_rover)
  end
end
