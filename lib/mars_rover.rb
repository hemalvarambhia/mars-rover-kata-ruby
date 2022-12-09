require_relative './direction'
require_relative './planet'
class MarsRover
  attr_reader :current_position

  def initialize(planet: Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5), starting_position:, orientation:)
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
    case @orientation
    when 'N'
      @current_position = @planet.next_location_to(@current_position, @orientation)
    when 'E'
      @current_position = @planet.next_location_to(@current_position, @orientation)
    when 'S'
      @current_position = @planet.next_location_to(@current_position, orientation)
    when 'W'
      @current_position = Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
    end
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
