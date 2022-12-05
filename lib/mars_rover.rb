require_relative './direction'
class MarsRover
  attr_reader :current_position

  def self.oriented_southward(starting_position:)
    MarsRover.new(starting_position: starting_position, orientation: 'S')
  end

  def initialize(starting_position:, orientation:)
    @current_position = starting_position
    @orientation = orientation
  end

  def execute(commands)
    commands.split('').each do |command|
      case command
      when 'f'
        move_forward
      when 'b'
        move_backwards
      when 'l'
        turn_left
      when 'r'
        turn_right
      end
    end
  end

  def orientation
    {
      'N' => Direction.north.direction,
      'E' => Direction.east.direction,
      'S' => Direction.south.direction
    }.fetch(@orientation, @orientation)
  end

  private

  def turn_right
    direction = direction_from_orientation[@orientation]
    if direction
      @orientation = direction.right
    end
  end

  def turn_left
    direction = direction_from_orientation[@orientation]
    if direction
      @orientation = direction.left
    end
  end

  def direction_from_orientation
    {
      'N' => Direction.north,
      'E' => Direction.east,
      'S' => Direction.south
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
    end
  end

  def move_forward
    case @orientation
    when 'N'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    when 'E'
      @current_position = Coordinates.new(x: (@current_position.x + 1), y: @current_position.y)
    when 'S'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
    end
  end
end