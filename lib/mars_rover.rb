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
        @current_position = move_backwards
      when 'l'
        @direction = turn_left(@direction)
      when 'r'
        @direction = turn_right(@direction)
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

  def turn_right(direction)
    {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N' }[direction]
  end

  def turn_left(direction)
    {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }[direction]
  end

  def move_backwards
    case @direction
    when 'N'
      Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
    when 'E'
      Coordinates.new(x: @current_position.x - 1, y: @current_position.y)
    when 'S'
      Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    when 'W'
      Coordinates.new(x: @current_position.x + 1, y: @current_position.y)
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
