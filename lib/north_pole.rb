require 'coordinates'
require 'location'

class NorthPole
  def self.forwards(location)
    Location.south_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y))
  end

  def self.backwards(location)
    Location.north_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y))
  end

  def self.rotate_left(location)
    Location.south_facing(location.coordinates)
  end

  def self.rotate_right(location)
    Location.south_facing(location.coordinates)
  end
end
