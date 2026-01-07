# Mars Rover - remotely controlled vehicle for Mars exploration

class Rover

  attr_reader :direction

  def initialize(coordinates:, direction:)
    raise ArgumentError, "Coordinates cannot be nil" if coordinates.nil?

    validate_direction!(direction)
    @coordinates = coordinates
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
    valid_directions = %i[north south east west]
    return if valid_directions.include?(direction)

    raise ArgumentError, "Invalid direction: #{direction}"
  end
end
