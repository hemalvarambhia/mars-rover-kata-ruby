require 'minitest/autorun'
require_relative './coordinate_assertion'
require_relative '../lib/wrapping_location'
class WrappingLocationWhenFacingSouthTest < Minitest::Test
  include CoordinateAssertion

  def test_no_wrapping_when_moving_forward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: 1, direction: 'S')

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: 0, direction: 'S')
    assert_coordinates_equal(expected_coordinate, coordinate)
  end

  def test_no_wrapping_when_moving_forward_to_the_bottom_edge
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: -4, direction: 'S')

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: -5, direction: 'S')
    assert_coordinates_equal(expected_coordinate, coordinate)
  end

  def test_wrapping_when_at_bottom_edge_and_moving_forward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: -5, direction: 'S')

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: 5, direction: 'S')
    assert_coordinates_equal(expected_coordinate, coordinate)
  end

  def test_wrapping_past_bottom_edge_when_moving_forward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    starting_coordinate = WrappingLocation.new(world: world, x: -1, y: -3, direction: 'S')

    coordinate = starting_coordinate

    5.times { coordinate = coordinate.move_forward }

    expected_coordinate = WrappingLocation.new(world: world, x: -1, y: 3, direction: 'S')
    assert_coordinates_equal(expected_coordinate, coordinate)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-5..5), y_range: (-5..5))
    starting_coordinate = WrappingLocation.new(world: world, x: -2, y: 2, direction: 'S')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: -2, y: 3, direction: 'S')
    assert_coordinates_equal(expected_coordinate, coordinate)
  end

  def test_no_wrapping_when_moving_backward_to_the_top_edge
    world = World.new(x_range: (-6..6), y_range: (-6..6))
    starting_coordinate = WrappingLocation.new(world: world, x: -2, y: 5, direction: 'S')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: -2, y: 6, direction: 'S')
    assert_coordinates_equal(expected_coordinate, coordinate)
  end

  def test_wrapping_when_at_top_edge_and_moving_backwards
    world = World.new(x_range: (-6..6), y_range: (-6..6))
    starting_coordinate = WrappingLocation.new(world: world, x: -5, y: 6, direction: 'S')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: -5, y: -6, direction: 'S')
    assert_coordinates_equal(expected_coordinate, coordinate)
  end

  def test_wrapping_past_top_edge_when_moving_backwards
    world = World.new(x_range: (-6..6), y_range: (-6..6))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: 4, direction: 'S')

    coordinate = starting_coordinate
    6.times {coordinate = coordinate.move_backward }

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: -3, direction: 'S')
    assert_coordinates_equal(expected_coordinate, coordinate)
  end

  def assert_coordinates_equal(coordinate, expected_coordinate)
    assert_equal(expected_coordinate.x, coordinate.x, "x-coordinate")
    assert_equal(expected_coordinate.y, coordinate.y, "y-coordinate")
  end
end
