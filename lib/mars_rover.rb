class MarsRover
  def initialize(x:, y:, starting_position: Coordinates.new(x: x, y: y))
    @current_position = Coordinates.new(x: x, y: y)
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
    'E'
  end
end