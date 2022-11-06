class FacingEast
  def initialize(location = nil)
    @location = location
  end

  def move_forward(location)
    if location.world.at_right_edge?(location)
      Location.new(world: location.world, x: location.world.left_edge, y: location.y, direction: location.direction)
    else
      Location.new(world: location.world, x: location.x + 1, y: location.y, direction: location.direction)
    end
  end

  def move_backward(location)
    if location.world.at_left_edge?(location)
      Location.new(world: location.world, x: location.world.right_edge, y: location.y, direction: location.direction)
    else
      Location.new(world: location.world, x: location.x - 1, y: location.y, direction: location.direction)
    end
  end

  def turn_left(location)
    Location.new(world: location.world, x: location.x, y: location.y, direction: 'N')
  end
end
