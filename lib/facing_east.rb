require 'forwardable'
class FacingEast
  extend Forwardable
  attr_reader :location, :world
  def_delegators :@location, :x, :y, :direction

  def initialize(location)
    @location = location
    @world = location.world
  end

  def move_forward
    world.next_location(location)
  end

  def move_backward
    world.previous_location(location)
  end

  def turn_left
    FacingNorth.new(Position.new(world: world, x: x, y: y, direction: 'N')).location
  end

  def turn_right
    FacingSouth.new(Position.new(world: world, x: x, y: y, direction: 'S')).location
  end
end
