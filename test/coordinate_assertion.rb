module CoordinateAssertion
  def assert_coordinates_equal(coordinate, expected_coordinate)
    assert_equal(expected_coordinate.x, coordinate.x, "x-coordinate")
    assert_equal(expected_coordinate.y, coordinate.y, "y-coordinate")
    assert_equal(expected_coordinate.direction, coordinate.direction, "direction")
  end
end
