require 'minitest/autorun'
require_relative './coordinate_assertion'
require_relative './location_assertion'
require_relative '../lib/world'
require_relative '../lib/location'
require_relative './mars_rover_on_cartesian_coordinates'
class WrappingLocationWhenFacingWestTest < Minitest::Test
  include CoordinateAssertion
  include LocationAssertion

  def test_no_wrapping_when_moving_forward
    world = World.new(x_range: (-3..3), y_range: (-3..3))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 3, y: 1), direction: 'W')

    mars_rover.execute('f')

    expected_coordinates = Location.new(world: world, x: 2, y: 1, direction: 'W')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_no_wrapping_when_moving_forward_to_the_left_hand_edge
    world = World.new(x_range: (-3..3), y_range: (-3..3))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 2, y: -2), direction: 'W')

    mars_rover.execute('f')

    expected_coordinates = Location.new(world: world, x: 1, y: -2, direction: 'W')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_wrapping_when_at_the_left_hand_edge_and_moving_forward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: -5, y: 5), direction: 'W')

    mars_rover.execute('f')

    expected_coordinates = Location.new(world: world, x: 5, y: 5, direction: 'W')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_wrapping_past_the_left_hand_edge_when_moving_forward
    world = World.new(x_range: (-6..6), y_range: (-6..6))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: -4, y: 7), direction: 'W')

    mars_rover.execute('ffff')

    expected_coordinates = Location.new(world: world, x: 5, y: 7, direction: 'W')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-3..3), y_range: (-3..3))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 1, y: 2), direction: 'W')

    mars_rover.execute('b')

    expected_coordinates = Location.new(world: world, x: 2, y: 2, direction: 'W')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_no_wrapping_when_moving_backward_to_the_right_hand_edge
    world = World.new(x_range: (-3..3), y_range: (-3..3))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 2, y: 0), direction: 'W')

    mars_rover.execute('b')

    expected_coordinates = Location.new(world: world, x: 3, y: 0, direction: 'W')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_wrapping_when_at_the_right_hand_edge_and_moving_backward
    world = World.new(x_range: (-7..7), y_range: (-7..7))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 7, y: 4), direction: 'W')

    mars_rover.execute('b')

    expected_coordinates = Location.new(world: world, x: -7, y: 4, direction: 'W')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_wrapping_past_the_right_hand_edge_when_moving_backward
    world = World.new(x_range: (-7..7), y_range: (-7..7))
    mars_rover = MarsRover.new(world: world, starting_coordinates: Coordinates.new(x: 5, y: 2), direction: 'W')

    mars_rover.execute('bbbbbb')

    expected_coordinates = Location.new(world: world, x: -4, y: 2, direction: 'W')
    assert_located_at(expected_coordinates, mars_rover)
  end
end
