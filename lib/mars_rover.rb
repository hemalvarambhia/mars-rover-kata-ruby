require_relative './direction'
class MarsRover
  attr_reader :current_position

  def initialize(planet:, starting_position:, orientation:)
    @current_position = starting_position
    @direction = MarsRover.direction_from_orientation[orientation]
    @planet = planet
  end

  def turn_right
    @direction = MarsRover.direction_from_orientation[@direction.right]
  end

  def turn_left
    @direction = MarsRover.direction_from_orientation[@direction.left]
  end

  def move_backwards
    @current_position = @planet.previous_location_to(@current_position, @direction)
  end

  def move_forward
    @current_position = @planet.next_location_to(@current_position, @direction)
  end

  def orientation
    @direction.direction
  end

  private

  def self.direction_from_orientation
    {
      'N' => Direction.north,
      'E' => Direction.east,
      'S' => Direction.south,
      'W' => Direction.west
    }
  end
end
