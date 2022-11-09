require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'

class MovingEastFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  include LocationAssertion

  def test_moving_nowhere
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: -1, y: -1, direction: 'E')
      )

    mars_rover.execute('')

    expected_location = Location.new(world: World.infinite, x: -1, y: -1, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: 0, y: 0, direction: 'E')
      )

    mars_rover.execute('f')

    expected_location = Location.new(world: World.infinite, x: 1, y: 0, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_backward
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: 2, y: 2, direction: 'E')
      )

    mars_rover.execute('b')

    expected_location = Location.new(world: World.infinite, x: 1, y: 2, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_multiple_steps_forwards_and_multiple_steps_backwards
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: 0, y: 4, direction: 'E')
      )

    mars_rover.execute('ffbbb')

    expected_location = Location.new(world: World.infinite, x: -1, y: 4, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: -3, y: -2, direction: 'E')
      )

    mars_rover.execute('z')

    expected_location = Location.new(world: World.infinite, x: -3, y: -2, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_nowhere_when_obstacle_is_adjacent_and_in_front
    skip('Test list')
  end

  def test_moving_one_step_forward_before_encountering_an_obstacle
    skip('Test list')
  end

  def test_moving_two_steps_forward_before_encountering_an_obstacle
    skip('Test list')
  end

  def test_moving_nowhere_when_obstacle_is_adjacent_and_behind
    skip('Test list')
  end

  def test_moving_one_step_backward_before_encountering_an_obstacle
    skip('Test list')
  end

  def test_moving_two_steps_backward_before_encountering_an_obstacle
    skip('Test list')
  end
end
