class Coordinates
  attr_reader :x, :y
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def translate(translation)
    Coordinates.new(x: x + translation.x, y: y + translation.y)
  end

  def +(delta)
    Coordinates.new(x: x + delta.x, y: y + delta.y)
  end

  def ==(coordinates)
    x == coordinates.x && y == coordinates.y
  end

  def inspect
    "(#{x}, #{y})"
  end
end
