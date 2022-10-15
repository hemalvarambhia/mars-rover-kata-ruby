require 'minitest/autorun'
require 'ostruct'
class MarsRover
  def initialize(x: 0, y: 0)
    @x = x
    @y = y
    @current_coordinates = OpenStruct.new(x: x, y: y)
  end

  def coordinates
    OpenStruct.new(x: @x, y: @y)
    @current_coordinates
  end

  def direction
    'N'
  end
end

class GettingCurrentPositionAndDirectionOfMarsRoverTest < MiniTest::Test
  def test_current_position_and_direction_of_north_facing_mars_rover
    mars_rover = MarsRover.new

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    assert_equal(0, coordinates.x)
    assert_equal(0, coordinates.y)
    assert_equal('N', direction)
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_x_axis
    mars_rover = MarsRover.new(x: 1)

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    assert_equal(1, coordinates.x)
    assert_equal(0, coordinates.y)
    assert_equal('N', direction)
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_y_axis
    mars_rover = MarsRover.new(y: 5)

    coordinates = mars_rover.coordinates
    direction = mars_rover.direction

    assert_equal(0, coordinates.x)
    assert_equal(5, coordinates.y)
    assert_equal('N', direction)
  end

  def test_current_position_and_direction_of_east_facing_mars_rover
    skip('Test list')
  end

  def test_current_position_and_direction_of_west_facing_mars_rover
    skip('Test list')
  end
end
