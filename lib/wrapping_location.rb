class WrappingLocation
  attr_reader :x, :y
  def initialize(x_range: (-4..4), x:, y:)
    @x = x
    @y = y
    @x_range = x_range
  end

  def move_forward
    if at_right_edge?
      WrappingLocation.new(x_range: x_range, x: @x_range.first, y: y)
    else
      WrappingLocation.new(x_range: x_range, x: x + 1, y: y)
    end
  end

  def move_backward
    if at_left_edge?
      WrappingLocation.new(x_range: x_range, x: @x_range.last, y: y)
    else
      WrappingLocation.new(x_range: x_range, x: x - 1, y: y)
    end
  end

  private

  attr_reader :x_range

  def at_left_edge?
    x == @x_range.first
  end

  def at_right_edge?
    x == @x_range.last
  end
end
