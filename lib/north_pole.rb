require 'coordinates'
require 'location'

class NorthPole
  def forwards(location)
    Location.south_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y))
  end
end
