require_relative '../lib/map'
require_relative '../lib/mars_rover'
require_relative '../lib/obstacle_detector'
module MarsRoverSetUp
  def self.mars_rover(on: Map.new, obstacle_detector: ObstacleDetector.new([]), starting_at:)
    MarsRover.new(map: on, obstacle_detector: obstacle_detector, starting_location: starting_at)
  end

  def a_mars_rover_facing(direction:)
    location = Location.new(direction: direction, coordinates: Coordinates.new(x: 0, y: 0))
    mars_rover(starting_at: location)
  end

  private

  def mars_rover(on: Map.new, obstacle_detector: ObstacleDetector.new([]), starting_at:)
    MarsRover.new(map: on, obstacle_detector: obstacle_detector, starting_location: starting_at)
  end
end
