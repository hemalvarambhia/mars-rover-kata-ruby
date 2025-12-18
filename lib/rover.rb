# Mars Rover - remotely controlled vehicle for Mars exploration

require_relative 'coordinates'

class Rover
  VALID_DIRECTIONS = %i[north south east west].freeze

  attr_reader :direction

  def initialize(x:, y:, direction:)
    validate_direction!(direction)
    @coordinates = Coordinates.new(x, y)
    @direction = direction
  end

  def x
    @coordinates.x
  end

  def y
    @coordinates.y
  end

  private

  def validate_direction!(direction)
    return if VALID_DIRECTIONS.include?(direction)

    raise ArgumentError, "Invalid direction: #{direction}"
  end
end

