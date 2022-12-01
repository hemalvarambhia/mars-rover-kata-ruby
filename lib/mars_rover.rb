class MarsRover
  attr_reader :orientation

  def initialize(starting_position:, orientation:)
    @current_position = starting_position
    @orientation = orientation
  end

  def execute(command)
    x = @current_position.x
    case command
    when 'f'
      x = move_forward
    when 'b'
      x = move_backwards
    when 'l'
      turn_left
    when 'r'
      turn_right
    end

    @current_position = Coordinates.new(x: x, y: @current_position.y)
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
    @current_position.x - 1
  end

  def move_forward
    @current_position.x + 1
  end
end