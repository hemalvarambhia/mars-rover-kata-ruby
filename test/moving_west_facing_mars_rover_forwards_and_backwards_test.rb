require 'minitest/autorun'
require_relative './location_assertion'
require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'
require_relative './mars_rover_on_cartesian_coordinates'
class MovingWestFacingMarsRoverForwardsAndBackwardsTest < Minitest::Test
  include LocationAssertion

  def test_moving_nowhere
    mars_rover =
      MarsRover.new(
        world: World.infinite,
        starting_coordinates: Coordinates.new(x: 3, y: 0),
        direction: 'W'
      )

    mars_rover.execute('')

    expected_location = Location.infinite(coordinates: Coordinates.new(x: 3, y: 0), direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.new(
        world: World.infinite,
        starting_coordinates: Coordinates.new(x: 3, y: 1),
        direction: 'W'
      )

    mars_rover.execute('f')

    expected_location = Location.infinite(coordinates: Coordinates.new(x: 2, y: 1), direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_backward
    mars_rover =
      MarsRover.new(
        world: World.infinite,
        starting_coordinates: Coordinates.new(x: -1, y: -1),
        direction: 'W'
      )

    mars_rover.execute('b')

    expected_location = Location.infinite(coordinates: Coordinates.new(x: 0, y: -1), direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.new(
        world: World.infinite,
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'W'
      )

    mars_rover.execute('j')

    expected_location = Location.infinite(coordinates: Coordinates.new(x: 0, y: 0), direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end
end
