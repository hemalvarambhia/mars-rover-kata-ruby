module LocationAssertion
  private

  def assert_located_at(expected_location, mars_rover)
    coordinates = mars_rover.position
    assert_equal(expected_location.x, coordinates.x, "Current location: #{coordinates}")
    assert_equal(expected_location.y, coordinates.y, "Current location: #{coordinates}")
    assert_equal(expected_location.direction, coordinates.direction, "direction")
  end
end
