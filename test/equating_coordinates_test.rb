require 'minitest/autorun'
require_relative '../lib/coordinates'
class EquatingCoordinatesTest < Minitest::Test
  def test_equals_is_reflexive
    coordinates = Coordinates.new(x: 1, y: 1)

    assert_equal(coordinates, coordinates)
  end

  def test_equals_is_symmetric
    coordinate_1 = Coordinates.new(x: 2, y: 3)
    coordinate_2 = Coordinates.new(x: 2, y: 3)

    assert_equal(coordinate_1, coordinate_2)
    assert_equal(coordinate_2, coordinate_1)
  end

  def test_equals_is_associative
    coordinate_1 = Coordinates.new(x: -1, y: 2)
    coordinate_2 = Coordinates.new(x: -1, y: 2)
    coordinate_3 = Coordinates.new(x: -1, y: 2)

    assert_equal(coordinate_2, coordinate_1)
    assert_equal(coordinate_3, coordinate_2)
    assert_equal(coordinate_3, coordinate_1)
  end

  def test_equals_is_transitive
    skip('Test list')
  end

  def test_two_coordinates_with_different_x_coordinates_are_unequal
    coordinate_1 = Coordinates.new(x: 1, y: 2)
    coordinate_2 = Coordinates.new(x: 3, y: 2)

    assert(coordinate_1 != coordinate_2)
  end

  def test_two_coordinates_with_different_y_coordinates_are_unequal
    coordinate_1 = Coordinates.new(x: 3, y: 5)
    coordinate_2 = Coordinates.new(x: 3, y: 2)

    assert(coordinate_1 != coordinate_2)
  end

  def test_two_coordinates_with_the_same_x_and_y_coordinates_are_equal
    coordinates = Coordinates.new(x: -3, y: -3)
    coordinates_with_same_x_and_y = Coordinates.new(x: -3, y: -3)

    assert_equal(coordinates_with_same_x_and_y, coordinates)
  end

  def test_a_coordinate_and_an_object_of_a_different_type_are_unequal
    skip('Test list')
  end
end
