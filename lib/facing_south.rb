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
end
