class FacingWest
  def move_forward(location)
    if location.world.at_left_edge?(location)
      Location.new(world: location.world, x: location.world.right_edge, y: location.y, direction: location.direction)
    else
      Location.new(world: location.world, x: location.x - 1, y: location.y, direction: location.direction)
    end
  end
end
