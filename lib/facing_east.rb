require 'forwardable'
class FacingEast
  extend Forwardable
  attr_reader :location, :world
  def_delegators :@location, :x, :y, :direction, :world

  def initialize(location)
    @location = location
    @world = location.world
  end

  def turn_left
    FacingNorth.new(Position.new(x: x, y: y, direction: 'N')).location
  end

  def turn_right
    FacingSouth.new(Position.new(x: x, y: y, direction: 'S')).location
  end
end
