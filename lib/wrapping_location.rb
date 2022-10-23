require_relative './world'
class WrappingLocation
  attr_reader :x, :y
  def initialize(x_range:, y_range:, x:, y:, direction: 'E')
    @x = x
    @y = y
    @world = World.new(x_range: x_range, y_range: y_range)
    @direction = direction
  end

  def move_forward
    if at_right_edge? && direction == 'E'
      WrappingLocation.new(x_range: world.x_range, y_range: world.y_range, x: world.left_edge, y: y)
    elsif at_top_edge? && direction == 'N'
       WrappingLocation.new(x_range: world.x_range, y_range: world.y_range, x: 3, y: -4)
    else
      WrappingLocation.new(x_range: world.x_range, y_range: world.y_range, x: x + 1, y: y)
    end
  end

  def move_backward
    if at_left_edge?
      WrappingLocation.new(x_range: world.x_range, y_range: world.y_range, x: world.right_edge, y: y)
    else
      WrappingLocation.new(x_range: world.x_range, y_range: world.y_range, x: x - 1, y: y)
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
