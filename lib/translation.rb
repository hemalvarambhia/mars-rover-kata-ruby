class Translation
  attr_reader :delta_x, :delta_y

  def initialize(delta_x:, delta_y:)
    @delta_x = delta_x
    @delta_y = delta_y
  end

  def +(translation)
    Translation.new(
      delta_x: delta_x + translation.delta_x,
      delta_y: delta_y + translation.delta_y
    )
  end
end
