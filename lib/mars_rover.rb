require 'coordinates'
class MarsRover
  attr_reader :direction, :current_position

  def initialize(direction:, starting_position:)
    @current_position = starting_position
    @direction = direction
  end

  def execute(commands_from_earth)
    commands_from_earth.each do |command|
      case command
      when 'f'
        move_forwards
      when 'b'
        move_backwards
      when 'l'
        turn_left
      when 'r'
        if @direction == 'N'
          @direction = 'E'
        elsif @direction == 'S'
          @direction = 'W'
        else
          @direction = 'S'
        end
      end
    end
  end

  def inspect
    "a Mars Rover at #{@current_position.inspect} facing #{direction}"
  end

  def to_s
    "a Mars Rover facing #{direction} starting from #{@current_position}"
  end

  private

  def turn_left
    @direction = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }[@direction]
  end

  def move_backwards
    case @direction
    when 'N'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
    when 'E'
      @current_position = Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
    when 'S'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    when 'W'
      @current_position = Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
    end
  end

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
