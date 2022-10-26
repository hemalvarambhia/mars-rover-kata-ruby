require_relative './world'
class WrappingLocation
  attr_reader :x, :y
  def initialize(world:, x:, y:, direction:)
    @x = x
    @y = y
    @world = world
    @direction = direction
  end

  def move_forward
    case direction
    when 'E'
      if at_right_edge?
        WrappingLocation.new(world: world, x: world.left_edge, y: y, direction: direction)
      else
        WrappingLocation.new(world: world, x: x + 1, y: y, direction: direction)
      end
    when 'N'
      if world.at_top_edge?(self)
        WrappingLocation.new(world: world, x: x, y: world.bottom_edge, direction: direction)
      else
        WrappingLocation.new(world: world, x: x, y: y + 1, direction: direction)
      end
    end
  end

  def move_backward
    case direction
    when 'E'
      if at_left_edge?
        WrappingLocation.new(world: world, x: world.right_edge, y: y, direction: direction)
      else
        WrappingLocation.new(world: world, x: x - 1, y: y, direction: direction)
      end
    else
      WrappingLocation.new(world: world, x: x, y: world.top_edge, direction: direction)
    end
  end

  private

  attr_reader :world, :direction

  def at_left_edge?
    world.at_left_edge?(self)
  end

  def at_right_edge?
    world.at_right_edge?(self)
  end

  def at_top_edge?
    world.at_top_edge?(self)
  end
end
