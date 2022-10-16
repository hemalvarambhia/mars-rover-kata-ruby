class Translation
  attr_reader :x, :y

  def initialize(delta_x:, delta_y:)
    @x = delta_x
    @y = delta_y
  end

  def +(translation)
    Translation.new(
      delta_x: x + translation.x,
      delta_y: y + translation.y      
    )
  end
end
