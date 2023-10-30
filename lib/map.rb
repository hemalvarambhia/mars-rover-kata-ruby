require 'coordinates'
require 'location'
class Map
  def with_north_pole_correction(location)
    if at_north_pole?(location.coordinates)
      Location.new(coordinates: Coordinates.new(x: 18, y: location.coordinates.y), direction: 'S').forwards
    else
      location
    end
  end

  private

  def at_north_pole?(coordinates)
    north_pole = Coordinates.new(x: 0, y: 9)
    coordinates == north_pole
  end
end
