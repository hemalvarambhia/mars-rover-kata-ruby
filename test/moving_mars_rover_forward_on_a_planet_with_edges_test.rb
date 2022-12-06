require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'
class MovingMarsRoverForwardOnAPlanetWithEdgesTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_forwards_to_the_northern_edge
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 1, y: 4))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 5), mars_rover)
  end

  def test_moving_forwards_from_the_northern_edge
    mars_rover = mars_rover_oriented_northward(Coordinates.new(x: 1, y: 5))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: -5), mars_rover)
  end

  def test_moving_forwards_past_the_northern_edge
    skip('Test list')
  end

  def test_moving_forwards_to_the_eastern_edge
    skip('Test list')
  end

  def test_moving_forwards_from_the_eastern_edge
    skip('Test list')
  end

  private

  def mars_rover_oriented_northward(starting_position)
    MarsRover.new(starting_position: starting_position, orientation: 'N')
  end
end
