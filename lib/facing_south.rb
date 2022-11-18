require 'forwardable'
class FacingSouth
  extend Forwardable
  attr_reader :location, :left, :right
  def_delegators :@location, :x, :y, :direction

  def initialize(location)
    @location = location
    @left = 'E'
    @right = 'W'
  end

  def turn_left
    FacingEast.new(Position.new(x: x, y: y, direction: 'E')).location
  end

  def turn_right
    FacingWest.new(Position.new(x: x, y: y, direction: 'W')).location
  end
end
