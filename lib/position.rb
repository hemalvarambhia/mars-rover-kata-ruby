class Position
  attr_reader :world, :x, :y, :direction

  def initialize(world: nil, x:, y:, direction:)
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
