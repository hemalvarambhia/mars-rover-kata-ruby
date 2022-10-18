require 'minitest/autorun'
require_relative './location_assertion'
require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'

class GettingCurrentPositionAndDirectionOfMarsRoverTest < MiniTest::Test
  include LocationAssertion

  def test_current_position_and_direction_of_north_facing_mars_rover
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    expected_location =
      Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_x_axis
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 1, y: 0),
        direction: 'N'
      )

    assert_at_point(Coordinates.new(x: 1, y: 0), 'N', mars_rover)
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_y_axis
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 5),
        direction: 'N'
      )

    assert_at_point(Coordinates.new(x: 0, y: 5), 'N', mars_rover)
  end

  def test_current_position_and_direction_of_east_facing_mars_rover
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'E'
      )

    direction = mars_rover.direction

    assert_equal('E', direction)
  end
end
