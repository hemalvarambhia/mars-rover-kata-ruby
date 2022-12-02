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
    @orientation = 'S'
  end

  def turn_left
    @orientation = 'N'
  end

  def move_backwards
    @current_position = Coordinates.new(x: (@current_position.x - 1), y: @current_position.y)
  end

  def move_forward
    case @orientation
    when 'E'
      @current_position = Coordinates.new(x: (@current_position.x + 1), y: @current_position.y)
    when 'N'
      @current_position = Coordinates.new(x: @current_position.x, y: @current_position.y + 1)
    end
  end
end