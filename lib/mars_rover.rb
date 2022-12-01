class MarsRover
  def initialize(starting_position:)
    @current_position = starting_position
    @direction = 'E'
  end

  def execute(command)
    x = @current_position.x
    y = @current_position.y
    if command == 'f'
      x = x + 1
    elsif command == 'b'
      x = x - 1
    end
    @current_position = Coordinates.new(x: x, y: y)
  end

  def x
    @current_position.x
  end

  def y
    @current_position.y
  end

  def direction
    @direction
  end
end