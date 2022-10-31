module CoordinateAssertion
  def assert_equals(expected_coordinates, coordinates)
    assert_equal(expected_coordinates.x, coordinates.x, "x-coordinate")
    assert_equal(expected_coordinates.y, coordinates.y, "y-coordinate")
    assert_equal(expected_coordinates.direction, coordinates.direction, "direction")
  end
end
