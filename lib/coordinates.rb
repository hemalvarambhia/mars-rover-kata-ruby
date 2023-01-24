class Coordinates
  attr_reader :x, :y
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def translate(displacement)
    self + displacement
  end

  def +(displacement)
    self.class.new(x: x + displacement.x, y: y + displacement.y)
  end

  def ==(coordinates)
    return false if coordinates.class != self.class
    x == coordinates.x && y == coordinates.y
  end

  def inspect
    "(#{x}, #{y})"
  end
end
