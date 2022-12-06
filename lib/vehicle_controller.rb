require_relative './direction'
class VehicleController
  attr_reader :current_position

  def execute(commands)
    commands.split('').select { |command| %w{f b l r}.include?(command) }.each do |command|
      instruction = instruction_from(command)
      send(instruction)
    end
  end

  def orientation
    direction_from_orientation[@orientation].direction
  end

  private

  def instruction_from(command)
    {
      'f' => :move_forward,
      'b' => :move_backwards,
      'l' => :turn_left,
      'r' => :turn_right
    }[command]
  end

  def initialize(starting_position:, orientation:)
    @current_position = starting_position
    @orientation = orientation
    @northern_edge = 5
    @southern_edge = -5
  end

  def turn_right
    direction = direction_from_orientation[@orientation]
    @orientation = direction.right
  end

  def turn_left
    direction = direction_from_orientation[@orientation]
    @orientation = direction.left
  end

  def direction_from_orientation
    {
      'N' => Direction.north,
      'E' => Direction.east,
      'S' => Direction.south,
      'W' => Direction.west
    }
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
      if at_northern_edge?
        @current_position = Coordinates.new(x: @current_position.x, y: @southern_edge)
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

  def at_northern_edge?
    @current_position.y == @northern_edge
  end
end