# A Mars Rover can point in one of four possible directions, definied here.
module CardinalDirections
  ALL_DIRECTIONS = %i[north south east west].freeze
  private_constant :ALL_DIRECTIONS

  def supported?(direction)
    ALL_DIRECTIONS.include?(direction)
  end
end