class MarsRover
  attr_reader :direction

  def initialize(x: 0, y: 0, direction: 'S')
    @current_position = Coordinate.new(x: x, y: y)
    @direction = direction
  end

  def x
    @current_position.x
  end

  def y
    @current_position.y
  end
end
