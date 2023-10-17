require 'coordinates'
class MarsRover
  attr_reader :direction, :current_position

  def initialize(direction:, starting_position:)
    @current_position = starting_position
    @direction = direction
  end

  def execute(commands_from_earth)
    commands_from_earth.each do |command|
      if command == 'f'
        move_forwards
      elsif command == 'b'
        case @direction
        when 'N'
          @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
        when 'E'
          @current_position = Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
        when 'S'
          @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
        end
      end
    end
  end

  def inspect
    "a Mars Rover at #{@current_position.inspect} facing #{direction}"
  end

  private

  def move_forwards
    case @direction
    when 'N'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    when 'E'
      @current_position = Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
    when 'S'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
    when 'W'
      @current_position = Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
    end
  end
end
