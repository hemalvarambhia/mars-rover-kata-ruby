class WrappingLocation
  attr_reader :x, :y
  def initialize(x_range: (-4..4), y_range: (-4..4), x:, y:, direction: 'E')
    @x = x
    @y = y
    @x_range = x_range
    @y_range = y_range
    @direction = direction
  end

  def move_forward
    if at_right_edge? && direction == 'E'
      WrappingLocation.new(x_range: x_range, x: @x_range.first, y: y)
    elsif @y == y_range.last && direction == 'N'
       WrappingLocation.new(x_range: x_range, y_range: y_range, x: 3, y: -4)
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

  attr_reader :x_range, :y_range, :direction

  def at_left_edge?
    x == @x_range.first
  end

  def at_right_edge?
    x == @x_range.last
  end
end
