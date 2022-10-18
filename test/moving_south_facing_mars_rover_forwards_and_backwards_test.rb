require 'minitest/autorun'
require_relative './location_assertion'
require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'

class MovingSouthFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  include LocationAssertion

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

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'S'
      )

    mars_rover.execute('e')

    expected_location = Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: 'S')
    assert_located_at(expected_location, mars_rover)
  end
end
