require 'forwardable'
class FacingNorth
  extend Forwardable
  attr_reader :location, :left, :right
  def_delegators :@location, :x, :y, :direction

  def initialize(location)
    @location = location
    @left = 'W'
    @right = 'E'
  end

  def turn_left
    FacingWest.new(Position.new(x: x, y: y, direction: 'W')).location
  end

  def turn_right
    FacingEast.new(Position.new(x: x, y: location.y, direction: 'E')).location
  end
end
