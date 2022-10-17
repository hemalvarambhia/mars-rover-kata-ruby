require 'minitest/autorun'
require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'

class MovingSouthFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  def test_moving_nowhere
    mars_rover = MarsRover.new(
                  starting_coordinates: Coordinates.new(x: 0, y: -1),
                  direction: 'S'
                )

    mars_rover.execute('')

    assert_at_point(Coordinates.new(x: 0, y: -1), 'S', mars_rover)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 2, y: 3),
        direction: 'S'
      )

    mars_rover.execute('f')

    assert_at_point(Coordinates.new(x: 2, y: 2), 'S', mars_rover)
  end

  def test_moving_one_step_backward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 3, y: 0),
        direction: 'S'
      )
    mars_rover.execute('b')

    assert_at_point(Coordinates.new(x: 3, y: 1), 'S', mars_rover)
  end

  private

  def assert_at_point(expected_coordinates, expected_direction, mars_rover)
    coordinates = mars_rover.coordinates
    direction = mars_rover.direction
    assert_equal(expected_coordinates, coordinates)
    assert_equal(expected_direction, direction)
  end
end
