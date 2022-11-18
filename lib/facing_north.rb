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
end
