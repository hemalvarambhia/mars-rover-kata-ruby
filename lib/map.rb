require 'north_pole'
require 'south_pole'
require 'planar_map'
class Map
  def initialize(obstacles:)

  end

  def map_for(location)
    if located_at_north_pole?(location)
      NorthPole.new
    elsif located_at_south_pole?(location)
      SouthPole.new
    else
      NonPolarMap.new(obstacles: [Coordinates.new(x: 1, y: 3)])
    end
  end

  def forwards(location)
    map_for(location.forwards).forwards(location)
  end

  def backwards(location)
    map_for(location.backwards).backwards(location)
  end

  def rotate_left(location)
    map_for(location).rotate_left(location)
  end

  def rotate_right(location)
    map_for(location).rotate_right(location)
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
