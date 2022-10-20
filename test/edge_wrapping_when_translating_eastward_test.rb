require 'minitest/autorun'
require_relative '../lib/wrapping_coordinates'
class EdgeWrappingWhenTranslatingEastwardTest < Minitest::Test
  def test_x_coordinate_does_not_wrap_when_well_inside_grid
    starting_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: 0, y: 0)

    coordinate = starting_coordinate.forward

    expected_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: 1, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end

  def test_x_coordinate_wraps_when_at_the_right_hand_edge
    starting_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: 4, y: 0)

    coordinate = starting_coordinate.forward

    expected_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: -4, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end

  def test_x_coordinate_wraps_when_translates_past_the_right_hand_edge
    starting_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: 3, y: 0)

    coordinate = starting_coordinate.forward.forward

    expected_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: -4, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end

  def test_x_coordinate_wraps_when_past_the_left_hand_edge
    starting_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: -4, y: 0)

    coordinate = starting_coordinate.backward.backward

    expected_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: 3, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end

  def test_x_coordinate_wraps_when_at_the_left_hand_edge
    starting_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: -4, y: 0)

    coordinate = starting_coordinate.backward

    expected_coordinate = WrappingCoordinates.new(x_range: (-4..4), x: 4, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end
end

