require 'forwardable'
class FacingSouth
  extend Forwardable
  attr_reader :location
  def_delegators :@location, :x, :y, :direction, :world

  def initialize(location)
    @location = location
  end

  def move_forward
    world.next_location(location)
  end

  def move_backward
    if world.at_top_edge?(location)
      Location.new(world: world, x: x, y: world.bottom_edge, direction: location.direction)
    else
      Location.new(world: location.world, x: location.x, y: location.y + 1, direction: location.direction)
    end
  end

  def turn_left
    FacingEast.new(Location.new(world: world, x: x, y: y, direction: 'E')).location
  end

  def turn_right
    FacingWest.new(Location.new(world: world, x: x, y: y, direction: 'W')).location
  end
end
