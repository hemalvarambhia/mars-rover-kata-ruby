class Position
  attr_reader :x, :y, :direction

  def initialize(x:, y:, direction: nil)
    @x = x
    @y = y
    @direction = direction
  end

  def ==(location)
    x == location.x && y == location.y
  end

  def inspect
    "(#{x}, #{y})"
  end
end
