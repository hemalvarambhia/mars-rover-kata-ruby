require 'minitest/autorun'
require_relative '../mars_rover_in_cartesian_coordinate_system'
class MovingAnEastFacingMarsRoverForwardsTest < Minitest::Test
  include CoordinatesAssertion

  def test_no_command_moves_mars_rover_nowhere
    mars_rover = mars_rover_oriented_eastward(nil, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 0, y: 0), mars_rover)
  end

  def test_no_command_leaves_mars_rovers_current_position_unchanged
    mars_rover = mars_rover_oriented_eastward(nil, Coordinates.new(x: 2, y: 1))

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 2, y: 1), mars_rover)
  end

  def test_moving_one_step_forward_from_the_origin
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 0), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_equal('E', mars_rover.orientation)
  end

  def test_moving_the_mars_rover_two_steps_forward
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 2))

    mars_rover.execute('ff')

    assert_located_at(Coordinates.new(x: 2, y: 2), mars_rover)
  end

  def test_moving_forwards_to_the_eastern_edge
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 4, y: 1))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 5, y: 1), mars_rover)
  end

  def test_moving_forwards_from_the_eastern_edge
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 5, y: -2))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: -5, y: -2), mars_rover)
  end

  def test_moving_forwards_past_the_eastern_edge
    planet = TorusShapedPlanet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 3, y: -2))

    mars_rover.execute('fffff')

    assert_located_at(Coordinates.new(x: -3, y: -2), mars_rover)
  end

  def test_mars_rover_cannot_move_forward_when_obstacle_is_in_front
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5, obstacles: [Coordinates.new(x: 3, y: 1)])
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 2, y: 1))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 2, y: 1), mars_rover)
  end

  def test_mars_rover_cannot_move_past_eastern_edge_when_obstacle_is_located_on_western_edge
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge:6, southern_edge: nil, western_edge: -6, obstacles: [Coordinates.new(x: -6, y: -1)])
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 6, y: -1))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 6, y: -1), mars_rover)
  end

  def test_mars_rover_can_move_forward_up_to_an_obstacle_and_not_beyond
    planet = TorusShapedPlanet.new(northern_edge: nil, eastern_edge:6, southern_edge: nil, western_edge: -6, obstacles: [Coordinates.new(x: 3, y: 3)])
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 3))

    mars_rover.execute('ffffff')

    assert_located_at(Coordinates.new(x: 2, y: 3), mars_rover)
  end

  private

  def mars_rover_oriented_eastward(planet, starting_position)
    mars_rover = MarsRover.new(planet: planet, starting_position: starting_position, orientation: 'E')
    VehicleController.new(vehicle: mars_rover)
  end
end
