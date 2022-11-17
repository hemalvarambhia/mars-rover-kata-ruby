module LocationAssertion
  private

  def assert_located_at(expected_location, mars_rover)
    coordinates = mars_rover.position
    assert_equal(expected_location, coordinates, "Current location: #{coordinates}")
    assert_equal(expected_location.direction, mars_rover.direction, "Facing: #{mars_rover.direction}")
  end
end
