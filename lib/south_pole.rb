require 'coordinates'
require 'location'

class SouthPole
  def self.forwards(location)
    Location.north_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y))
  end

  def self.backwards(location)
    Location.south_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y))
  end

  def self.rotate_left(location)
    Location.north_facing(location.coordinates)
  end

  def self.rotate_right(location)
    Location.north_facing(location.coordinates)
  end
end
