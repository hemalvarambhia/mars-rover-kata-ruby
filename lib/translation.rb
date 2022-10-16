class Translation
  attr_reader :x, :y, :delta_x

  def initialize(delta_x:, delta_y:)
    @x = delta_x
    @y = delta_y
    @delta_x = delta_x
  end

  def +(translation)
    Translation.new(
      delta_x: x + translation.delta_x,
      delta_y: y + translation.y
    )
  end
end
