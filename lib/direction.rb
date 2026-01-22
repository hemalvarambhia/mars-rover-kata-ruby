# frozen_string_literal: true

# Cardinal direction with associated movement delta
class Direction
  DELTAS = {
    north: [0, 1],
    south: [0, -1],
    east: [1, 0],
    west: [-1, 0]
  }.freeze

  def self.valid?(direction)
    DELTAS.key?(direction)
  end

  def self.delta_for(direction)
    DELTAS.fetch(direction)
  end

  def self.all
    DELTAS.keys
  end
end
