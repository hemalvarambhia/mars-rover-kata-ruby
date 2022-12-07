require_relative './direction'
require_relative './planet'
class MarsRover
  attr_reader :current_position

  def initialize(starting_position:, orientation:)
    @current_position = starting_position
    @orientation = orientation
    @planet = Planet.new
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
    case @orientation
    when 'N'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
    when 'E'
      @current_position = Coordinates.new(x: (@current_position.x - 1), y: @current_position.y)
    when 'S'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    when 'W'
      @current_position = Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
    end
  end

  def move_forward
    case @orientation
    when 'N'
      if @planet.at_northern_edge?(@current_position)
        @current_position = Coordinates.new(x: @current_position.x, y: @planet.southern_edge)
      else
        @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
      end
    when 'E'
      @current_position = Coordinates.new(x: (@current_position.x + 1), y: @current_position.y)
    when 'S'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
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
