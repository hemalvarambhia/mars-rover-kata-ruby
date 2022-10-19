class Translation
  attr_reader :delta_x, :delta_y

  def initialize(delta_x:, delta_y:)
    @delta_x = delta_x
    @delta_y = delta_y
  end
end
