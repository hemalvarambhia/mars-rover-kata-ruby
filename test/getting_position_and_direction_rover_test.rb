require 'minitest/autorun'
require 'ostruct'
class Coordinates
  attr_reader :x, :y
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(coordinates)
    x == coordinates.x && y == coordinates.y
  end
end

class MarsRover
  def initialize(starting_coordinates:)
    @current_coordinates = starting_coordinates
  end

  def coordinates
    @current_coordinates
  end

  def direction
    'N'
  end
end

class GettingCurrentPositionAndDirectionOfMarsRoverTest < MiniTest::Test
  def test_current_position_and_direction_of_north_facing_mars_rover
    mars_rover =
      MarsRover.new(starting_coordinates: Coordinates.new(x: 0, y: 0))

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    expected_coordinates = Coordinates.new(x: 0, y: 0)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('N', direction)
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_x_axis
    mars_rover =
      MarsRover.new(starting_coordinates: Coordinates.new(x: 1, y: 0))

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    expected_coordinates = Coordinates.new(x: 1, y: 0)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('N', direction)
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_y_axis
    mars_rover =
      MarsRover.new(starting_coordinates: Coordinates.new(x: 0, y: 5))

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    expected_coordinates = Coordinates.new(x: 0, y: 5)
    assert_equal(expected_coordinates, coordinates)
    assert_equal('N', direction)
  end

  def test_current_position_and_direction_of_east_facing_mars_rover
    skip('Test list')
  end

  def test_current_position_and_direction_of_west_facing_mars_rover
    skip('Test list')
  end
end
