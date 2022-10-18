require 'minitest/autorun'
require_relative './location_assertion'
class TurningMarsRoverLeftTest < Minitest::Test
  include LocationAssertion

  def test_turning_north_facing_mars_rover
    mars_rover = MarsRover.new(starting_coordinates: Coordinates.new(x: -1, y: 2), direction: 'N')

    mars_rover.execute('l')

    expected_location = Location.new(coordinates: Coordinates.new(x: -1, y: 2), direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_east_facing_mars_rover
    skip('Test list')
  end

  def test_turning_south_facing_mars_rover
    skip('Test list')
  end

  def test_turning_west_facing_mars_rover
    skip('Test list')
  end
end
