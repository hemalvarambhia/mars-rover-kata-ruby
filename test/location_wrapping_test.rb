require 'minitest/autorun'
require_relative '../lib/wrapping_location'
class LocationWrappingTest < Minitest::Test
  def test_wrapping_when_at_the_top_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 3, y: 4, direction: 'N')

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: 3, y: -4, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_past_the_top_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 3, y: 3, direction: 'N')

    coordinate = starting_coordinate
    3.times { coordinate = coordinate.move_forward }

    expected_coordinate = WrappingLocation.new(world: world, x: 3, y: -3, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_when_at_bottom_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 1, y: -4, direction: 'N')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: 1, y: 4, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_moving_backwards_with_no_wrapping
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: 1, direction: 'N')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: 0, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_past_bottom_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: -2, direction: 'N')

    coordinate = starting_coordinate
    4.times { coordinate = coordinate.move_backward }

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: 3, direction: 'N')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  private

  def assert_coordinates_equal(coordinate, expected_coordinate)
    assert_equal(expected_coordinate.x, coordinate.x, "x-coordinate")
    assert_equal(expected_coordinate.y, coordinate.y, "y-coordinate")
  end
end
