# A Mars Rover can point in one of four possible directions, definied here.
module CardinalDirections
  ALL_DIRECTIONS = %i[north south east west].freeze
  private_constant :ALL_DIRECTIONS

  def supported?(direction)
    ALL_DIRECTIONS.include?(direction)
  end

  def forwards(direction)
    {
      north: Displacement.new(dx: 0, dy: 1),
      east: Displacement.new(dx: 1, dy: 0),
      south: Displacement.new(dx: 0, dy: -1),
      west: Displacement.new(dx: -1, dy: 0)
    }[direction]
  end
end