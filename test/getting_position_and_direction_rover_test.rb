require 'minitest/autorun'
require_relative '../lib/coordinates'

class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end

  def coordinates
    @current_coordinates
  end
end

class GettingCurrentPositionAndDirectionOfMarsRoverTest < MiniTest::Test
  def test_current_position_and_direction_of_north_facing_mars_rover
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 0),
        direction: 'N'
      )

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    expected_coordinates = Coordinates.new(x: 0, y: 0)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('N', direction)
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_x_axis
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 1, y: 0),
        direction: 'N'
      )

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    expected_coordinates = Coordinates.new(x: 1, y: 0)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('N', direction)
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_y_axis
    mars_rover =
      MarsRover.new(
        starting_coordinates: Coordinates.new(x: 0, y: 5),
        direction: 'N'
      )

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    expected_coordinates = Coordinates.new(x: 0, y: 5)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('N', direction)
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
