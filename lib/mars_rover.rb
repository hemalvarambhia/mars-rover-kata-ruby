require 'coordinates'
class MarsRover
  attr_reader :direction, :current_position

  def initialize(direction:, starting_position:)
    @current_position = starting_position
    @direction = direction
  end

  def execute(commands_from_earth)
    commands_from_earth.each do |_|
      case @direction
      when 'N'
        @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
      when 'E'
        @current_position = Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
      when 'S'
        @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
      end
    end
  end

  def x
    @current_position.x
  end

  def y
    @current_position.y
  end

  def inspect
    "a Mars Rover at #{@current_position.inspect} facing #{direction}"
  end
end
