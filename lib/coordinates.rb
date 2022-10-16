class Coordinates
  attr_reader :x, :y
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def translate(translation)
    Coordinates.new(x: x + translation.delta_x, y: y + translation.delta_y)
  end

  def ==(coordinates)
    x == coordinates.x && y == coordinates.y
  end

  def inspect
    "(#{x}, #{y})"
  end
end
