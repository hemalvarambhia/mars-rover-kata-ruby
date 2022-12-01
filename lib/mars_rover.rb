class MarsRover
  attr_reader :orientation

  def initialize(starting_position:, orientation:)
    @current_position = starting_position
    @orientation = orientation
  end

  def execute(command)
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

  def x
    @current_position.x
  end

  def y
    @current_position.y
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
    @current_position = Coordinates.new(x: (@current_position.x + 1), y: @current_position.y)
  end
end