class MarsRover
  attr_reader :direction

  def initialize(x:, y:, direction:)
    @current_position = Coordinates.new(x: x, y: y)
    @direction = direction
  end

  def x
    @current_position.x
  end

  def y
    @current_position.y
  end
end
