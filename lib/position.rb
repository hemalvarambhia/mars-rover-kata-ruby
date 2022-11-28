class Position
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def move(movement)
    Position.new(x: x + movement.x, y: y + movement.y)
  end

  def ==(location)
    x == location.x && y == location.y
  end

  def inspect
    "(#{x}, #{y})"
  end
end
