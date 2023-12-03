require 'coordinates'
require 'location'

class NorthPole
  def forwards(location)
    Location.south_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y))
  end

  def backwards(location)
    Location.north_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y))
  end

  def rotate_left(location)
    Location.south_facing(location.coordinates)
  end

  def rotate_right(location)
    Location.south_facing(location.coordinates)
  end
end
