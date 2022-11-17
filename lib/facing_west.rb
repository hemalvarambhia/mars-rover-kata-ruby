require 'forwardable'
class FacingWest
  extend Forwardable
  attr_reader :location
  def_delegators :@location, :x, :y, :direction, :world

  def initialize(location)
    @location = location
  end

  def turn_left
    FacingSouth.new(Position.new(x: x, y: y, direction: 'S')).location
  end

  def turn_right
    FacingNorth.new(Position.new(x: location.x, y: location.y, direction: 'N')).location
  end
end
