require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'

class MovingEastFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  include LocationAssertion

  def test_moving_nowhere
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: -1, y: -1),
        direction: 'E'
      )

    mars_rover.execute('')

    assert_at_point(Coordinates.new(x: -1, y: -1), 'E', mars_rover)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'E'
      )

    mars_rover.execute('f')

    assert_at_point(Coordinates.new(x: 1, y: 0), 'E', mars_rover)
  end

  def test_moving_one_step_backward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 2, y: 2),
        direction: 'E'
      )

    mars_rover.execute('b')

    assert_at_point(Coordinates.new(x: 1, y: 2), 'E', mars_rover)
  end

  def test_moving_multiple_steps_forwards_and_multiple_steps_backwards
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 4),
        direction: 'E'
      )

    mars_rover.execute('ffbbb')

    assert_at_point(Coordinates.new(x: -1, y: 4), 'E', mars_rover)
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: -3, y: -2),
        direction: 'E'
      )

    mars_rover.execute('z')

    assert_at_point(Coordinates.new(x: -3, y: -2), 'E', mars_rover)
  end
end
