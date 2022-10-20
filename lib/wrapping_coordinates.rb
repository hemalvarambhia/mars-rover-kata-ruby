class WrappingCoordinates
  attr_reader :x, :y
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def translate(translation)
    if x == 4
      WrappingCoordinates.new(x: -4, y: y + translation.delta_y)
    else
      WrappingCoordinates.new(x: x + translation.delta_x, y: y + translation.delta_y)
    end
  end
end
