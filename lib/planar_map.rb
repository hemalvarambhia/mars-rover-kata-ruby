require 'coordinates'
require 'location'
class PlanarMap
  def initialize(obstacles: nil)

  end

  def forwards(location)
    case location.direction
    when 'N'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y + 1), direction: location.direction)
    when 'E'
      Location.new(coordinates: Coordinates.new(x: (location.x + 1) % 36, y: location.y), direction: location.direction)
    when 'S'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y - 1), direction: location.direction)
    when 'W'
      Location.new(coordinates: Coordinates.new(x: (location.x - 1) % 36, y: location.y), direction: location.direction)
    end
  end

  def backwards(location)
    case location.direction
    when 'N'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y - 1), direction: location.direction)
    when 'E'
      Location.new(coordinates: Coordinates.new(x: (location.x - 1) % 36, y: location.y), direction: location.direction)
    when 'S'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y + 1), direction: location.direction)
    when 'W'
      Location.new(coordinates: Coordinates.new(x: (location.x + 1) % 36, y: location.y), direction: location.direction)
    end
  end


  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  def rotate_left(location)
    Location.new(
      coordinates: location.coordinates,
      direction: TURN_LEFT[location.direction]
    )
  end

  TURN_RIGHT = TURN_LEFT.invert
  private_constant :TURN_RIGHT

  def rotate_right(location)
    Location.new(
      coordinates: location.coordinates,
      direction: TURN_RIGHT[location.direction]
    )
  end
end
