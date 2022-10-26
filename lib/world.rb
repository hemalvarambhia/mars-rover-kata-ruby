class World
  attr_reader :x_range, :y_range

  def initialize(x_range:, y_range:)
    @x_range = x_range
    @y_range = y_range
  end

  def top_edge
    y_range.last
  end

  def bottom_edge
    y_range.first
  end

  def left_edge
    x_range.first
  end

  def right_edge
    x_range.last
  end

  def at_left_edge?(location)
    location.x == left_edge
  end

  def at_right_edge?(location)
    location.x == right_edge
  end

  def at_top_edge?(location)
    location.y == y_range.last
  end
end
