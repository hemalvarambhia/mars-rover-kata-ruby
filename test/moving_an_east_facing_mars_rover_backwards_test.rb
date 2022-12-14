require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'

class MovingAnEastFacingMarsRoverBackwardsTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_one_step_backwards_from_any_position
    planet = Planet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 3, y: 5))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 2, y: 5), mars_rover)
  end

  def test_an_unsupported_command_does_nothing_to_the_mars_rover
    planet = Planet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 3, y: 2))

    mars_rover.execute('u')

    assert_located_at(Coordinates.new(x: 3, y: 2), mars_rover)
  end

  def test_moving_backwards_to_the_western_edge
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -6, western_edge: -6)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: -5, y: -2))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: -6, y: -2), mars_rover)
  end

  def test_moving_backwards_from_the_western_edge
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -6, western_edge: -6)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: -6, y: 4))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 5, y: 4), mars_rover)
  end

  def test_mars_rover_cannot_move_backwards_when_obstacle_is_behind_it
    skip('Test list')
  end

  def test_mars_rover_can_move_backwards_up_to_an_obstacle_and_not_beyond
    skip('Test list')
  end

  def test_mars_rover_cannot_move_past_western_edge_when_obstacle_is_located_on_eastern_edge
    skip('Test list')
  end

  private

  def mars_rover_oriented_eastward(planet, starting_position)
    mars_rover =
      MarsRover.new(
        planet: planet,
        starting_position: starting_position,
        orientation: 'E'
      )
    VehicleController.new(vehicle: mars_rover)
  end
end