require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'
class MovingANorthFacingMarsRoverForwardTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_one_step_forward_from_the_origin
    planet = Planet.new(northern_edge: nil, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 0, y: 1), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: -1, y: -2))

    mars_rover.execute('f')

    assert_equal('N', mars_rover.orientation)
  end

  def test_moving_forwards_to_the_northern_edge
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 1, y: 4))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 5), mars_rover)
  end

  def test_moving_forwards_from_the_northern_edge
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 1, y: 5))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: -5), mars_rover)
  end

  def test_moving_forwards_past_the_northern_edge
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 1, y: 4))

    mars_rover.execute('fff')

    assert_located_at(Coordinates.new(x: 1, y: -4), mars_rover)
  end

  def test_mars_rover_cannot_move_forward_when_obstacle_is_in_front
    planet = Planet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil, obstacles: [Coordinates.new(x: 0, y: 1)])
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 0, y: 0), mars_rover)
  end

  def test_mars_rover_can_move_forward_up_to_an_obstacle_and_not_beyond
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil, obstacles: [Coordinates.new(x: 0, y: 3)])
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('ffff')

    assert_located_at(Coordinates.new(x: 0, y: 2), mars_rover)
  end

  def test_mars_rover_can_move_forward_when_obstacle_is_adjacent
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5, obstacles: [Coordinates.new(x: 0, y: 2)])
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 1, y: 1))
    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 2), mars_rover)
  end

  def test_mars_rover_cannot_move_past_northern_edge_when_obstacle_is_located_on_southern_edge
    planet = Planet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil, obstacles: [Coordinates.new(x: 0, y: -6)])
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 0, y: 6))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 0, y: 6), mars_rover)
  end

  private

  def mars_rover_oriented_northward(planet, starting_position)
    VehicleController.new(
      vehicle: MarsRover.new(
        planet: planet,
        starting_position: starting_position, orientation: 'N')
    )
  end
end
