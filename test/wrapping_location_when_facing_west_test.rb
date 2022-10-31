require 'minitest/autorun'
require_relative './coordinate_assertion'
require_relative '../lib/wrapping_location'
class WrappingLocationWhenFacingWestTest < Minitest::Test
  include CoordinateAssertion

  def test_no_wrapping_when_moving_forward
    world = World.new(x_range: (-3..3), y_range: (-3..3))
    starting_coordinates = WrappingLocation.new(world: world, x: 3, y: 1, direction: 'W')

    coordinates = starting_coordinates.move_forward

    expected_coordinates = WrappingLocation.new(world: world, x: 2, y: 1, direction: 'W')
    assert_equals(expected_coordinates, coordinates)
  end

  def test_no_wrapping_when_moving_forward_to_the_left_hand_edge
    world = World.new(x_range: (-3..3), y_range: (-3..3))
    starting_coordinates = WrappingLocation.new(world: world, x: 2, y: -2, direction: 'W')

    coordinates = starting_coordinates.move_forward

    expected_coordinates = WrappingLocation.new(world: world, x: 1, y: -2, direction: 'W')
    assert_equals(expected_coordinates, coordinates)
  end

  def test_wrapping_when_at_the_left_hand_edge_and_moving_forward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    starting_coordinates = WrappingLocation.new(world: world, x: -5, y: 5, direction: 'W')

    coordinates = starting_coordinates.move_forward

    expected_coordinates = WrappingLocation.new(world: world, x: 5, y: 5, direction: 'W')
    assert_equals(expected_coordinates, coordinates)
  end

  def test_wrapping_past_the_left_hand_edge_when_moving_forward
    world = World.new(x_range: (-6..6), y_range: (-6..6))
    starting_coordinates = WrappingLocation.new(world: world, x: -4, y: 7, direction: 'W')

    coordinates = starting_coordinates
    4.times { coordinates = coordinates.move_forward }

    expected_coordinates = WrappingLocation.new(world: world, x: 5, y: 7, direction: 'W')
    assert_equals(expected_coordinates, coordinates)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-3..3), y_range: (-3..3))
    starting_coordinates = WrappingLocation.new(world: world, x: 1, y: 2, direction: 'W')

    coordinates = starting_coordinates.move_backward

    expected_coordinates = WrappingLocation.new(world: world, x: 2, y: 2, direction: 'W')
    assert_equals(expected_coordinates, coordinates)
  end

  def test_no_wrapping_when_moving_backward_to_the_right_hand_edge
    world = World.new(x_range: (-3..3), y_range: (-3..3))
    starting_coordinates = WrappingLocation.new(world: world, x: 2, y: 0, direction: 'W')

    coordinates = starting_coordinates.move_backward

    expected_coordinates = WrappingLocation.new(world: world, x: 3, y: 0, direction: 'W')
    assert_equals(expected_coordinates, coordinates)
  end

  def test_wrapping_when_at_the_right_hand_edge_and_moving_backward
    skip('Test list')
  end

  def test_wrapping_past_the_right_hand_edge_when_moving_backward
    skip('Test list')
  end
end
