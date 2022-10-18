require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'

class MovingNorthFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  include LocationAssertion

  def test_moving_nowhere
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    mars_rover.execute('')

    assert_at_point(Coordinates.new(x: 0, y: 0), 'N', mars_rover)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    mars_rover.execute('f')

    assert_at_point(Coordinates.new(x: 0, y: 1), 'N', mars_rover)
  end

  def test_moving_two_steps_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    mars_rover.execute('ff')

    assert_at_point(Coordinates.new(x: 0, y: 2), 'N', mars_rover)
  end

  def test_moving_multiple_steps_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    mars_rover.execute('fff')

    assert_at_point(Coordinates.new(x: 0, y: 3), 'N', mars_rover)
  end

  def test_rover_moves_back_one_step
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 2, y: 0),
        direction: 'N'
      )

    mars_rover.execute('b')

    assert_at_point(Coordinates.new(x: 2, y: -1), 'N', mars_rover)
  end

  def test_rover_moves_multiple_steps_backward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: -3, y: 0),
        direction: 'N'
      )

    mars_rover.execute('bbbb')

    assert_at_point(Coordinates.new(x: -3, y: -4), 'N', mars_rover)
  end

  def test_rover_moves_multiple_steps_forward_and_multiple_steps_backward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 3, y: 0),
        direction: 'N'
      )

    mars_rover.execute('fffbb')

    assert_at_point(Coordinates.new(x: 3, y: 1), 'N', mars_rover)
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 1, y: 0),
        direction: 'N'
      )

    mars_rover.execute('z')

    assert_at_point(Coordinates.new(x: 1, y: 0), 'N', mars_rover)
  end
end
