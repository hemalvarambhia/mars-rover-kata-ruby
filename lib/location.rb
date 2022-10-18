require_relative './translation'
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

  def turn_left
    if direction == 'N'
      Location.new(coordinates: coordinates, direction: 'W')
    elsif direction == 'E'
      Location.new(coordinates: coordinates, direction: 'N')
    else
      Location.new(coordinates: coordinates, direction: 'E')
    end
  end

  def ==(location)
    coordinates == location.coordinates && direction == location.direction
  end

  def inspect
    "#{coordinates.inspect} facing #{direction}"
  end

  private

  def translate(translation)
    @coordinates = @coordinates.translate(translation)
    Location.new(coordinates: @coordinates, direction: @direction)
  end
end
