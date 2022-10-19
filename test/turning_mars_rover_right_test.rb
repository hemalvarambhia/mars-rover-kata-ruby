require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'
class TurningMarsRoverRightTest < Minitest::Test
  include LocationAssertion

  def test_turning_north_facing_mars_rover
    mars_rover = MarsRover.new(starting_coordinates: Coordinates.new(x: 4, y: 1), direction: 'N')

    mars_rover.execute('r')

    expected_location = Location.new(coordinates: Coordinates.new(x: 4, y: 1), direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_east_facing_mars_rover
    mars_rover = MarsRover.new(starting_coordinates: Coordinates.new(x: 2, y: -3), direction: 'E')

    mars_rover.execute('r')

    expected_location = Location.new(coordinates: Coordinates.new(x: 2, y: -3), direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_south_facing_mars_rover
    skip('Test list')
  end

  def test_turning_west_facing_mars_rover
    skip('Test list')
  end

  def test_turning_north_facing_rover_twice
    skip('Test list')
  end

  def test_turning_south_facing_rover_twice
    skip('Test list')
  end
end
