require 'minitest/autorun'
require_relative '../lib/wrapping_location'
class WrappingLocationWhenFacingSouthTest < Minitest::Test
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
    skip('Test list')
  end

  def test_no_wrapping_when_moving_backward
    skip('Test list')
  end

  def test_wrapping_when_at_top_edge_and_moving_backwards
    skip('Test list')
  end

  def test_wrapping_past_top_edge_when_moving_backwards
    skip('Test list')
  end

  def assert_coordinates_equal(coordinate, expected_coordinate)
    assert_equal(expected_coordinate.x, coordinate.x, "x-coordinate")
    assert_equal(expected_coordinate.y, coordinate.y, "y-coordinate")
  end
end
