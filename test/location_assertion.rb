module LocationAssertion
  private

  def assert_at_point(expected_coordinates, expected_direction, mars_rover)
    coordinates = mars_rover.coordinates
    direction = mars_rover.direction
    assert_equal(expected_coordinates, coordinates)
    assert_equal(expected_direction, direction)
  end
end
