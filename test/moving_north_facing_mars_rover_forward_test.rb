require 'minitest/autorun'
require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'

class MovingNorthFacingMarsRoverForward < MiniTest::Test
  def test_moving_nowhere
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    mars_rover.execute('')

    coordinates = mars_rover.coordinates
    assert_equal(Coordinates.new(x: 0, y: 0), coordinates)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    mars_rover.execute('f')

    coordinates = mars_rover.coordinates
    assert_equal(Coordinates.new(x: 0, y: 1), coordinates)
  end

  def test_moving_two_steps_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    mars_rover.execute('ff')

    coordinates = mars_rover.coordinates
    assert_equal(Coordinates.new(x: 0, y: 2), coordinates)
  end

  def test_moving_multiple_steps_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    mars_rover.execute('fff')

    coordinates = mars_rover.coordinates
    assert_equal(Coordinates.new(x: 0, y: 3), coordinates)
  end

  def test_rover_moves_back_one_step
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 2, y: 0),
        direction: 'N'
      )

    mars_rover.execute('b')

    coordinates = mars_rover.coordinates
    assert_equal(Coordinates.new(x: 2, y: -1), coordinates)
  end

  def test_rover_moves_multiple_steps_backward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: -3, y: 0),
        direction: 'N'
      )

    mars_rover.execute('bbbb')

    coordinates = mars_rover.coordinates
    assert_equal(Coordinates.new(x: -3, y: -4), coordinates)
  end

  def test_rover_moves_multiple_steps_forward_and_multiple_steps_backward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 3, y: 0),
        direction: 'N'
      )

    mars_rover.execute('fffbb')

    coordinates = mars_rover.coordinates
    assert_equal(Coordinates.new(x: 3, y: 1), coordinates)
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 1, y: 0),
        direction: 'N'
      )

    mars_rover.execute('z')

    coordinates = mars_rover.coordinates
    assert_equal(Coordinates.new(x: 1, y: 0), coordinates)
  end
end
