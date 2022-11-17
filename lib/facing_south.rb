require 'forwardable'
class FacingSouth
  extend Forwardable
  attr_reader :location
  def_delegators :@location, :x, :y, :direction, :world

  def initialize(location)
    @location = location
  end

  def turn_left
    FacingEast.new(Position.new(world: nil, x: x, y: y, direction: 'E')).location
  end

  def turn_right
    FacingWest.new(Position.new(world: nil, x: x, y: y, direction: 'W')).location
  end
end
