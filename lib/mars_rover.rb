require_relative './direction'
require_relative './planet'
class MarsRover
  attr_reader :current_position

  def initialize(planet:, starting_position:, orientation:)
    @current_position = starting_position
    @orientation = orientation
    @planet = planet
  end

  def turn_right
    direction = direction_from_orientation[@orientation]
    @orientation = direction.right
  end

  def turn_left
    direction = direction_from_orientation[@orientation]
    @orientation = direction.left
  end

  def move_backwards
    @current_position = @planet.previous_location_to(@current_position, @orientation)
  end

  def move_forward
    @current_position = @planet.next_location_to(@current_position, @orientation)
  end

  def orientation
    direction_from_orientation[@orientation].direction
  end

  private

  def direction_from_orientation
    {
      'N' => Direction.north,
      'E' => Direction.east,
      'S' => Direction.south,
      'W' => Direction.west
    }
  end
end
