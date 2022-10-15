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

  def test_moving_three_steps_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    mars_rover.execute('fff')

    coordinates = mars_rover.coordinates
    assert_equal(Coordinates.new(x: 0, y: 3), coordinates)
  end
end
