require 'minitest/autorun'
require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'

class MovingEastFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  def test_moving_one_step_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'E'
      )

    mars_rover.execute('f')

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    expected_coordinates = Coordinates.new(x: 1, y: 0)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('E', direction)
  end

  def test_moving_one_step_backward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 2, y: 2),
        direction: 'E'
      )

    mars_rover.execute('b')

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    expected_coordinates = Coordinates.new(x: 1, y: 2)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('E', direction)
  end
end
