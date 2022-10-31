require 'minitest/autorun'
require_relative './coordinate_assertion'
require_relative '../lib/world'
require_relative '../lib/wrapping_location'
class WrappingLocationWhenFacingNorthTest < Minitest::Test
  include CoordinateAssertion

  def no_wrapping_when_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 2, y: 1, direction: 'N')

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: 2, y: 2, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_no_wrapping_when_moving_forward_to_the_top_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 2, y: 3, direction: 'N')

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: 2, y: 4, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_when_at_the_top_edge_and_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 3, y: 4, direction: 'N')

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: 3, y: -4, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_past_the_top_edge_when_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 3, y: 3, direction: 'N')

    coordinate = starting_coordinate
    3.times { coordinate = coordinate.move_forward }

    expected_coordinate = WrappingLocation.new(world: world, x: 3, y: -3, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: 1, direction: 'N')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: 0, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_no_wrapping_when_moving_backward_to_the_bottom_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: -3, direction: 'N')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: -4, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_when_at_bottom_edge_and_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 1, y: -4, direction: 'N')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: 1, y: 4, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_past_the_bottom_edge_when_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: -2, direction: 'N')

    coordinate = starting_coordinate
    4.times { coordinate = coordinate.move_backward }

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: 3, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end
end
