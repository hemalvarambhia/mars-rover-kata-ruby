class WrappingCoordinates
  attr_reader :x, :y
  def initialize(x_range: (-4..4), x:, y:)
    @x = x
    @y = y
    @x_range = x_range
  end

  def forward
    if x == @x_range.last
      WrappingCoordinates.new(x: @x_range.first, y: y)
    else
      WrappingCoordinates.new(x: x + 1, y: y)
    end
  end

  def translate(translation)
    if x == @x_range.last
      WrappingCoordinates.new(x: @x_range.first, y: y + translation.delta_y)
    elsif x == @x_range.first
      WrappingCoordinates.new(x: @x_range.last, y: y + translation.delta_y)
    else
      WrappingCoordinates.new(x: x + translation.delta_x, y: y + translation.delta_y)
    end
  end
end
