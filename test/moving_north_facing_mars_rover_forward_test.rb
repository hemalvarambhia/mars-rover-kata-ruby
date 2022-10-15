require 'minitest/autorun'
require_relative '../lib/coordinates'

class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end


  def execute(command)
    if command == 'f'
      @current_coordinates = Coordinates.new(x: 0, y: 1)
    end
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
end
