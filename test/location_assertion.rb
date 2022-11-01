module LocationAssertion
  private

  def assert_located_at(expected_location, mars_rover)
    coordinates = mars_rover.position
    assert_equal(expected_location.x, coordinates.x)
    assert_equal(expected_location.y, coordinates.y)
    assert_equal(expected_location.direction, coordinates.direction)
  end
end
