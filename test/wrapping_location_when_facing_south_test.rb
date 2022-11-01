require 'minitest/autorun'
require_relative './location_assertion'
require_relative '../lib/world'
require_relative '../lib/location'
require_relative './mars_rover_on_cartesian_coordinates'
class WrappingLocationWhenFacingSouthTest < Minitest::Test
  include LocationAssertion

  def test_no_wrapping_when_moving_forward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 0, y: 1), direction: 'S')

    mars_rover.execute('f')

    expected_coordinate = Location.new(world: world, x: 0, y: 0, direction: 'S')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_no_wrapping_when_moving_forward_to_the_bottom_edge
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 0, y: -4), direction: 'S')

    mars_rover.execute('f')

    expected_coordinate = Location.new(world: world, x: 0, y: -5, direction: 'S')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_wrapping_when_at_bottom_edge_and_moving_forward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 0, y: -5), direction: 'S')

    mars_rover.execute('f')

    expected_coordinate = Location.new(world: world, x: 0, y: 5, direction: 'S')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_wrapping_past_bottom_edge_when_moving_forward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: -1, y: -3), direction: 'S')

    mars_rover.execute('fffff')

    expected_coordinate = Location.new(world: world, x: -1, y: 3, direction: 'S')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: -2, y: 2), direction: 'S')

    mars_rover.execute('b')

    expected_coordinate = Location.new(world: world, x: -2, y: 3, direction: 'S')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_no_wrapping_when_moving_backward_to_the_top_edge
    world = World.new(x_range: (-6..6), y_range: (-6..6))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: -2, y: 5), direction: 'S')

    mars_rover.execute('b')

    expected_coordinate = Location.new(world: world, x: -2, y: 6, direction: 'S')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_wrapping_when_at_top_edge_and_moving_backwards
    world = World.new(x_range: (-6..6), y_range: (-6..6))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: -5, y: 6), direction: 'S')

    mars_rover.execute('b')

    expected_coordinate = Location.new(world: world, x: -5, y: -6, direction: 'S')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_wrapping_past_top_edge_when_moving_backwards
    world = World.new(x_range: (-6..6), y_range: (-6..6))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 0, y: 4), direction: 'S')

    mars_rover.execute('bbbbbb')

    expected_coordinate = Location.new(world: world, x: 0, y: -3, direction: 'S')
    assert_located_at(expected_coordinate, mars_rover)
  end
end
