module CoordinatesAssertion
  private

  def assert_located_at(coordinates, mars_rover)
    assert_equal(coordinates, mars_rover.current_position, "Coordinates")
  end
end
