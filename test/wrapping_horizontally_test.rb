require 'minitest/autorun'
require_relative '../lib/wrapping_location'
class WrappingHorizontallyTest < Minitest::Test
  def test_x_coordinate_does_not_wrap_when_well_inside_grid
    starting_coordinate = WrappingLocation.new(x_range: (-4..4), x: 0, y: 0)

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(x_range: (-4..4), x: 1, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end

  def test_x_coordinate_wraps_when_at_the_right_hand_edge
    starting_coordinate = WrappingLocation.new(x_range: (-4..4), x: 4, y: 0)

    coordinate = starting_coordinate.move_forward

    expected_coordinate = WrappingLocation.new(x_range: (-4..4), x: -4, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end

  def test_x_coordinate_wraps_when_translates_past_the_right_hand_edge
    starting_coordinate = WrappingLocation.new(x_range: (-4..4), x: 3, y: 0)

    coordinate = starting_coordinate.move_forward.move_forward

    expected_coordinate = WrappingLocation.new(x_range: (-4..4), x: -4, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end

  def test_x_coordinate_wraps_when_at_the_left_hand_edge
    starting_coordinate = WrappingLocation.new(x_range: (-4..4), x: -4, y: 0)

    coordinate = starting_coordinate.move_backward

    expected_coordinate = WrappingLocation.new(x_range: (-4..4), x: 4, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end

  def test_x_coordinate_wraps_when_past_the_left_hand_edge
    starting_coordinate = WrappingLocation.new(x_range: (-4..4), x: -4, y: 0)

    coordinate = starting_coordinate.move_backward.move_backward

    expected_coordinate = WrappingLocation.new(x_range: (-4..4), x: 3, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end

  def test_x_coordinate_starting_away_from_origin_and_wrapping_back_to_origin
    starting_coordinate = WrappingLocation.new(x_range: (-4..4), x: 2, y: 0)
    coordinate = starting_coordinate
    7.times { coordinate = coordinate.move_forward }

    expected_coordinate = WrappingLocation.new(x_range: (-4..4), x: 0, y: 0)
    assert_equal(expected_coordinate.x, coordinate.x)
    assert_equal(expected_coordinate.y, coordinate.y)
  end
end

