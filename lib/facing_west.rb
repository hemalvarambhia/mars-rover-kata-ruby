require 'forwardable'
class FacingWest
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
    world.previous_location(location)
  end

  def turn_left
    FacingSouth.new(Location.new(world: world, x: x, y: y, direction: 'S')).location
  end

  def turn_right
    FacingNorth.new(Location.new(world: location.world, x: location.x, y: location.y, direction: 'N')).location
  end
end
