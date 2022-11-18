require 'forwardable'
class FacingEast
  extend Forwardable
  attr_reader :location, :left, :right
  def_delegators :@location, :x, :y, :direction

  def initialize(location)
    @location = location
    @left = 'N'
    @right = 'S'
  end
end
