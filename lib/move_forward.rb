require_relative './move_backward'
class MoveForward
  def invert
    MoveBackward.new
  end

  def execute(location)
    world = location.world
    case location.direction
    when 'E'
      if world.at_right_edge?(location)
        Location.new(world: world, x: world.left_edge, y: location.y, direction: location.direction)
      else
        Location.new(world: world, x: location.x + 1, y: location.y, direction: location.direction)
      end
    when 'N'
      if world.at_top_edge?(location)
        Location.new(world: world, x: location.x, y: world.bottom_edge, direction: location.direction)
      else
        Location.new(world: world, x: location.x, y: location.y + 1, direction: location.direction)
      end
    when 'S'
      if world.at_bottom_edge?(location)
        Location.new(world: world, x: location.x, y: world.top_edge, direction: location.direction)
      else
        Location.new(world: world, x: location.x, y: location.y - 1, direction: location.direction)
      end
    when 'W'
      if world.at_left_edge?(location)
        Location.new(world: world, x: world.right_edge, y: location.y, direction: location.direction)
      else
        Location.new(world: world, x: location.x - 1, y: location.y, direction: location.direction)
      end
    end
  end
end
