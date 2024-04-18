require 'coordinates'
require 'location'
class PlanarMap

  def self.forwards(location, direction = location.direction)
    case direction
    when 'N'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y + 1), direction: direction)
    when 'E'
      Location.new(coordinates: Coordinates.new(x: (location.x + 1) % 36, y: location.y), direction: direction)
    when 'S'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y - 1), direction: direction)
    when 'W'
      Location.new(coordinates: Coordinates.new(x: (location.x - 1) % 36, y: location.y), direction: direction)
    end
  end

  def self.backwards(location, direction = location.direction)
    case direction
    when 'N'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y - 1), direction: direction)
    when 'E'
      Location.new(coordinates: Coordinates.new(x: (location.x - 1) % 36, y: location.y), direction: direction)
    when 'S'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y + 1), direction: direction)
    when 'W'
      Location.new(coordinates: Coordinates.new(x: (location.x + 1) % 36, y: location.y), direction: direction)
    end
  end


  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  def self.rotate_left(location)
    Location.new(
      coordinates: location.coordinates,
      direction: TURN_LEFT[location.direction]
    )
  end

  TURN_RIGHT = TURN_LEFT.invert
  private_constant :TURN_RIGHT

  def self.rotate_right(location)
    Location.new(
      coordinates: location.coordinates,
      direction: TURN_RIGHT[location.direction]
    )
  end

  def self.invert(direction)
    {
      'N' => 'S',
      'S' => 'N',
      'E' => 'W',
      'W' => 'E'
    }[direction]
  end
  private_class_method :invert
end
