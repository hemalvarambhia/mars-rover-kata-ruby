class Coordinates
  attr_reader :x, :y
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(other)
    return false if !other.is_a?(Coordinates)

    x == other.x && y == other.y
  end

  def inspect
    "(#{x},#{y})"
  end
end