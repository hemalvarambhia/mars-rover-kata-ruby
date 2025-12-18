# Mars Rover - remotely controlled vehicle for Mars exploration

class Rover
  VALID_DIRECTIONS = %i[north south east west].freeze

  attr_reader :x, :y, :direction

  def initialize(x:, y:, direction:)
    validate_direction!(direction)
    @x = x
    @y = y
    @direction = direction
  end

  private

  def validate_direction!(direction)
    return if VALID_DIRECTIONS.include?(direction)

    raise ArgumentError, "Invalid direction: #{direction}"
  end
end

