require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'
class MarsRoverMakingARectangleTest < Minitest::Test
  include LocationAssertion

  def test_making_a_rectangle
    mars_rover = MarsRover.new(starting_coordinates: Coordinates.new(x: -2, y: 1), direction: 'S')

    mars_rover.execute('fflfffflfflffff')

    expected_location = WrappingLocation.infinite(coordinates: Coordinates.new(x: -2, y: 1), direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end
end
