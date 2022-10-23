class World
  def initialize(x_range:, y_range:)
    @x_range = x_range
  end

  def at_left_edge?(location)
    location.x == x_range.first
  end

  private

  attr_reader :x_range
end
