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
    on_left_turn = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }
    Location.new(coordinates: coordinates, direction: on_left_turn[direction])
  end

  def ==(location)
    coordinates == location.coordinates && direction == location.direction
  end

  def inspect
    "#{coordinates.inspect} facing #{direction}"
  end

  private

  def translate(translation)
    Location.new(coordinates: @coordinates.translate(translation), direction: @direction)
  end
end
