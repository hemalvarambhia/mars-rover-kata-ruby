class MarsRover
  attr_reader :orientation, :current_position

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

  private

  def turn_right
    case @orientation
    when 'N'
      @orientation = 'E'
    when 'E'
      @orientation = 'S'
    end
  end

  def turn_left
    case @orientation
    when 'N'
      @orientation = 'W'
    when 'E'
      @orientation = 'N'
    end
  end

  def move_backwards
    case @orientation
    when 'N'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y - 1)
    when 'E'
      @current_position = Coordinates.new(x: (@current_position.x - 1), y: @current_position.y)
    end
  end

  def move_forward
    case @orientation
    when 'N'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    when 'E'
      @current_position = Coordinates.new(x: (@current_position.x + 1), y: @current_position.y)
    end
  end
end