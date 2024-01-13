require 'north_pole'
require 'south_pole'
require 'planar_map'
class Map
  def map_for(location)
    if located_at_north_pole?(location)
      NorthPole.new
    elsif located_at_south_pole?(location)
      SouthPole.new
    else
      NonPolarMap.new
    end
  end

  private

  def located_at_south_pole?(location)
    south_pole_latitude = -9
    location.y == south_pole_latitude
  end

  def located_at_north_pole?(location)
    north_pole_latitude = 9
    location.y == north_pole_latitude
  end
end
