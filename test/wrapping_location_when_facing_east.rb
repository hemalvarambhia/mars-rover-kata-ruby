require 'minitest/autorun'
require_relative '../lib/wrapping_location'
class WrappingLocationWhenFacingEast < Minitest::Test
  def test_no_wrapping_when_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 0, y: 0, direction: 'E')

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: 1, y: 0, direction: 'E')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_when_at_the_right_hand_edge_and_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 4, y: 0, direction: 'E')

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: -4, y: 0, direction: 'E')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_past_the_right_hand_edge_when_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 3, y: 0, direction: 'E')

    coordinate = starting_coordinate.move_forward.move_forward

    expected_coordinate = WrappingLocation.new(world: world, x: -4, y: 0, direction: 'E')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_starting_away_from_origin_and_wrapping_back_to_origin
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 2, y: 0, direction: 'E')
    coordinate = starting_coordinate

    7.times { coordinate = coordinate.move_forward }

    expected_coordinate = WrappingLocation.new(world: world, x: 0, y: 0, direction: 'E')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: 2, y: 0, direction: 'E')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: 1, y: 0, direction: 'E')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_when_at_the_left_hand_edge_and_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: -4, y: 0, direction: 'E')

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: 4, y: 0, direction: 'E')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end

  def test_wrapping_past_the_left_hand_edge_when_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    starting_coordinate = WrappingLocation.new(world: world, x: -4, y: 0, direction: 'E')

    coordinate = starting_coordinate.move_backward.move_backward

    expected_coordinate = WrappingLocation.new(world: world, x: 3, y: 0, direction: 'E')
    assert_coordinates_equal(coordinate, expected_coordinate)
  end
end
