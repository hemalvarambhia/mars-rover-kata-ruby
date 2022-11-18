require 'forwardable'
class FacingWest
  extend Forwardable
  attr_reader :location, :left, :right
  def_delegators :@location, :x, :y, :direction

  def initialize(location)
    @location = location
    @left = 'S'
    @right = 'N'
  end
end
