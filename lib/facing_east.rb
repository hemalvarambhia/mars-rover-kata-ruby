require 'forwardable'
class FacingEast
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
    if world.at_left_edge?(location)
      Location.new(world: world, x: world.right_edge, y: y, direction: direction)
    else
      Location.new(world: world, x: x - 1, y: y, direction: direction)
    end
  end

  def turn_left
    FacingNorth.new(Location.new(world: world, x: x, y: y, direction: 'N')).location
  end

  def turn_right
    FacingSouth.new(Location.new(world: world, x: x, y: y, direction: 'S')).location
  end
end
