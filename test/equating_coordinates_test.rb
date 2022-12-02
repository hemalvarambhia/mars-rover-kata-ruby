require 'minitest/autorun'
require_relative '../lib/coordinates'
class EquatingCoordinatesTest < Minitest::Test
  def test_equals_is_reflexive
    coordinates = Coordinates.new(x: 1, y: 1)

    assert_equal(coordinates, coordinates)
  end

  def test_equals_is_symmetric
    skip('Test list')
  end

  def test_equals_is_associative
    skip('Test list')
  end

  def test_equals_is_transitive
    skip('Test list')
  end

  def test_two_coordinates_with_different_x_coordinates_are_unequal
    skip('Test list')
  end

  def test_two_coordinates_with_different_y_coordinates_are_unequal
    skip('Test list')
  end

  def test_two_coordinates_with_the_same_x_and_y_coordinates_are_equal
    skip('Test list')
  end

  def test_a_coordinate_and_an_object_of_a_different_type_are_unequal
    skip('Test list')
  end
end
