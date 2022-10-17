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

    direction = mars_rover.direction
    coordinates = mars_rover.coordinates
    expected_coordinates = Coordinates.new(x: 0, y: -1)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('S', direction)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 2, y: 3),
        direction: 'S'
      )

    mars_rover.execute('f')

    direction = mars_rover.direction
    coordinates = mars_rover.coordinates
    expected_coordinates = Coordinates.new(x: 2, y: 2)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('S', direction)
  end

  def test_moving_one_step_backward
    skip('Next test to get passing')
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 3, y: 0),
        direction: 'S'
      )
    mars_rover.execute('b')

    direction = mars_rover.direction
    coordinates = mars_rover.coordinates
    expected_coordinates = Coordinates.new(x: 3, y: 1)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('S', direction)
  end
end
