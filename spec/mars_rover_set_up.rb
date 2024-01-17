require_relative '../lib/map'
require_relative '../lib/mars_rover'
module MarsRoverSetUp
  private

  def mars_rover(on: Map.with_no_obstacles, starting_at:)
    MarsRover.new(map: on, starting_location: starting_at)
  end
end
