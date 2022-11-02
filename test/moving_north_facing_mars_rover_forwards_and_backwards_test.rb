require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'

class MovingNorthFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  include LocationAssertion

  def test_moving_nowhere
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: 0, y: 0, direction: 'N')
      )

    mars_rover.execute('')

    expected_location = Location.new(world: World.infinite, x: 0, y: 0, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: 0, y: 0, direction: 'N')
      )

    mars_rover.execute('f')

    expected_location = Location.new(world: World.infinite, x: 0, y: 1, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_two_steps_forward
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: 0, y: 0, direction: 'N')
      )

    mars_rover.execute('ff')

    expected_location = Location.new(world: World.infinite, x: 0, y: 2, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_multiple_steps_forward
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: 0, y: 0, direction: 'N')
      )

    mars_rover.execute('fff')

    expected_location = Location.new(world: World.infinite, x: 0, y: 3, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_back_one_step
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: 2, y: 0, direction: 'N')
      )

    mars_rover.execute('b')

    expected_location = Location.new(world: World.infinite, x: 2, y: -1, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_multiple_steps_backward
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: -3, y: 0, direction: 'N')
      )

    mars_rover.execute('bbbb')

    expected_location = Location.new(world: World.infinite, x: -3, y: -4, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_multiple_steps_forward_and_multiple_steps_backward
    mars_rover =
      MarsRover.positioned_at(
        Location.new(world: World.infinite, x: 3, y: 0, direction: 'N')
      )

    mars_rover.execute('fffbb')

    expected_location = Location.new(world: World.infinite, x: 3, y: 1, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.new(
        Location.new(world: World.infinite, x: 1, y: 0, direction: 'N')
      )

    mars_rover.execute('z')

    expected_location = Location.new(world: World.infinite, x: 1, y: 0, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end
end
