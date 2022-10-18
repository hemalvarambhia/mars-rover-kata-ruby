class Location
  attr_reader :coordinates, :direction

  def initialize(coordinates:, direction:)
    @coordinates = coordinates
    @direction = direction
  end

  def move_forward
    translate(Translation.forward(direction))
  end

  def move_backward
    translate(Translation.backward(direction))
  end

  def translate(translation)
    @coordinates = @coordinates.translate(translation)
    Location.new(coordinates: @coordinates, direction: @direction)
  end

  def ==(location)
    coordinates == location.coordinates && direction == location.direction
  end

  def inspect
    "#{coordinates.inspect} facing #{direction}"
  end
end
