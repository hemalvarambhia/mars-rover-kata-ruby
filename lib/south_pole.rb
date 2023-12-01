require 'coordinates'
require 'location'

class SouthPole
  def forwards(location)
    Location.north_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y))
  end

  def backwards(location)
    Location.south_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y))
  end
end
