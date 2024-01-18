require 'north_pole'
require 'south_pole'
require 'planar_map'
class Map

  def self.with_no_obstacles
    new(obstacles: [])
  end

  def initialize(obstacles:)
    @obstacles = obstacles
    @north_pole = NorthPole.new
    @south_pole = SouthPole.new
  end

  def map_for(location)
    if located_at_north_pole?(location)
      @north_pole
    elsif located_at_south_pole?(location)
      @south_pole
    else
      PlanarMap.new
    end
  end

  def forwards(location)
    next_location = map_for(location.forwards).forwards(location)
    if obstacle_encountered_at?(next_location)
      [location, @obstacles.first]
    else
      next_location
    end
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

  def obstacle_encountered_at?(location)
    @obstacles.include?(location.coordinates)
  end
end
