require_relative '../lib/map'
require_relative '../lib/mars_rover'
module MarsRoverSetUp
  private

  def mars_rover(on: Map.with_no_obstacles, obstacle_detector: ObstacleDetector.new(on.obstacles), starting_at:)
    MarsRover.new(map: on, obstacle_detector: obstacle_detector, starting_location: starting_at)
  end
end
