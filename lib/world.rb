class World
  attr_reader :x_range, :y_range

  def self.infinite
    new(
      x_range: (-Float::INFINITY..Float::INFINITY),
      y_range: (-Float::INFINITY..Float::INFINITY)
    )
  end

  def initialize(x_range:, y_range:)
    @x_range = x_range
    @y_range = y_range
  end

  def next_location(location)
    if at_right_edge?(location)
      Location.new(world: self, x: left_edge, y: location.y, direction: location.direction)
    else
      Location.new(world: self, x: location.x + 1, y: location.y, direction: location.direction)
    end
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

  def at_bottom_edge?(location)
    location.y == y_range.first
  end
end
