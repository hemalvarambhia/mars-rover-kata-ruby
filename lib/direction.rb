# frozen_string_literal: true

# Cardinal direction with associated movement delta
class Direction
  attr_reader :delta

  private_class_method :new

  def initialize(delta)
    @delta = delta
  end

  NORTH = new([0, 1]).freeze
  SOUTH = new([0, -1]).freeze
  EAST = new([1, 0]).freeze
  WEST = new([-1, 0]).freeze

  def self.all
    [NORTH, SOUTH, EAST, WEST]
  end
end
