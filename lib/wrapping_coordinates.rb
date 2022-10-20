class WrappingCoordinates
  attr_reader :x, :y
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def translate(translation)
    WrappingCoordinates.new(x: 1, y: 0)
  end
end
