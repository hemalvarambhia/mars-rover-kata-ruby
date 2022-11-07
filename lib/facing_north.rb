require 'forwardable'
class FacingNorth
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
    FacingWest.new(Location.new(world: world, x: x, y: y, direction: 'W')).location
  end

  def turn_right
    FacingEast.new(Location.new(world: world, x: x, y: location.y, direction: 'E')).location
  end
end
