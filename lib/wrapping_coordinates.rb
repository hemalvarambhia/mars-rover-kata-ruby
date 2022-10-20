class WrappingCoordinates
  attr_reader :x, :y
  def initialize(x_range: (-4..4), x:, y:)
    @x = x
    @y = y
    @x_range = x_range
  end

  def forward
    if at_right_edge?
      WrappingCoordinates.new(x: @x_range.first, y: y)
    else
      WrappingCoordinates.new(x: x + 1, y: y)
    end
  end

  def backward
    if at_left_edge?
      WrappingCoordinates.new(x: @x_range.last, y: y)
    else
      WrappingCoordinates.new(x: x - 1, y: y)
    end
  end

  private

  def at_left_edge?
    x == @x_range.first
  end

  def at_right_edge?
    x == @x_range.last
  end
end
