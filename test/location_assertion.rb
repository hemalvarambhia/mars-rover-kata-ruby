module LocationAssertion
  private

  def assert_located_at(expected_location, mars_rover)
    coordinates = mars_rover.position
    assert_equal(expected_location.x, coordinates.x)
    assert_equal(expected_location.y, coordinates.y)
    assert_equal(expected_location.direction, coordinates.direction)
  end

  def assert_at_point(expected_coordinates, expected_direction, mars_rover)
    expected_position =
      Location.infinite(
        coordinates: expected_coordinates,
        direction: expected_direction
      )
    assert_located_at(expected_position, mars_rover)
  end
end
