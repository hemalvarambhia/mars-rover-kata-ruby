require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'
class MovingWestFacingMarsRoverForwardsAndBackwardsTest < Minitest::Test
  include LocationAssertion

  def test_moving_nowhere
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(world: World.infinite, x: 3, y: 0, direction: 'W')
      )

    mars_rover.execute('')

    expected_location = Position.new(world: World.infinite, x: 3, y: 0, direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(world: World.infinite, x: 3, y: 1, direction: 'W')
      )

    mars_rover.execute('f')

    expected_location = Position.new(world: World.infinite, x: 2, y: 1, direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_backward
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(world: World.infinite, x: -1, y: -1, direction: 'W')
      )

    mars_rover.execute('b')

    expected_location = Position.new(world: World.infinite, x: 0, y: -1, direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(world: World.infinite, x: 0, y: 0, direction: 'W')
      )

    mars_rover.execute('j')

    expected_location = Position.new(world: World.infinite, x: 0, y: 0, direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end
end
