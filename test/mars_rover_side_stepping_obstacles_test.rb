require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'
class MarsRoverSideSteppingObstaclesTest < Minitest::Test
  include LocationAssertion

  def test_side_steps_obstacles
    planet = Planet.new(x_range: (-8..8), y_range: (-8..8), obstacles: [Position.new(x: 0, y: 3), Position.new(x: 1, y: 3)])
    mars_rover = MarsRover.positioned_at(planet, Position.new(x: 0, y: 0), 'N')

    mars_rover.execute('fffrfflfflf')

    expected_location = Position.new(x: 1, y: 4, direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end
end
