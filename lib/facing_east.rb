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
    world.previous_location(location)
  end

  def turn_left
    FacingNorth.new(Location.new(world: world, x: x, y: y, direction: 'N')).location
  end

  def turn_right
    FacingSouth.new(Location.new(world: world, x: x, y: y, direction: 'S')).location
  end
end
