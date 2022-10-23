class World
  def initialize(x_range:, y_range:)
    @x_range = x_range
    @y_range = y_range
  end

  def left_edge
    x_range.first
  end

  def at_left_edge?(location)
    location.x == x_range.first
  end

  def at_right_edge?(location)
    location.x == x_range.last
  end

  def at_top_edge?(location)
    location.y == y_range.last
  end


  private

  attr_reader :x_range, :y_range
end
