require 'forwardable'
class FacingNorth
  extend Forwardable
  attr_reader :location
  def_delegators :@location, :x, :y, :direction, :world

  def initialize(location)
    @location = location
  end

  def move_forward
    if location.world.at_top_edge?(location)
      Location.new(world: world, x: x, y: world.bottom_edge, direction: direction)
    else
      Location.new(world: world, x: x, y: y + 1, direction: direction)
    end
    world.next_location(location)
  end

  def move_backward
    if world.at_bottom_edge?(location)
      Location.new(world: world, x: x, y: world.top_edge, direction: direction)
    else
      Location.new(world: world, x: x, y: y - 1, direction: direction)
    end
  end

  def turn_left
    FacingWest.new(Location.new(world: world, x: x, y: y, direction: 'W')).location
  end

  def turn_right
    FacingEast.new(Location.new(world: world, x: x, y: location.y, direction: 'E')).location
  end
end
