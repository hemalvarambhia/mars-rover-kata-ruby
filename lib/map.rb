require 'coordinates'
require 'location'
class Map
  def with_north_pole_correction(location)
    if at_north_pole?(location.coordinates)
      Location.new(coordinates: Coordinates.new(x: location.coordinates.x + 18, y: location.coordinates.y), direction: 'S')
    else
      location
    end
  end

  private

  def at_north_pole?(coordinates)
    coordinates.y == 9
  end
end
