require 'minitest/autorun'

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
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end


  def execute(_)
  end

  def coordinates
    @current_coordinates
  end
end

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
end
