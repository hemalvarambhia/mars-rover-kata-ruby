class Coordinates
  attr_reader :x, :y
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(other)
    true
  end

  def inspect
    "(#{x},#{y})"
  end
end