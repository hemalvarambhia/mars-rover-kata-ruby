require 'forwardable'
class FacingNorth
  extend Forwardable
  attr_reader :location
  def_delegators :@location, :x, :y, :direction, :world

  def initialize(location)
    @location = location
  end

  def turn_left
    FacingWest.new(Position.new(world: world, x: x, y: y, direction: 'W')).location
  end

  def turn_right
    FacingEast.new(Position.new(world: world, x: x, y: location.y, direction: 'E')).location
  end
end
