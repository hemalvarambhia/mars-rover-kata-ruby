module LocationAssertion
  private

  def assert_that(mars_rover, located_at:, facing:)
    coordinates = mars_rover.position
    assert_equal(located_at, coordinates, "Current location: #{coordinates}")
    assert_equal(facing, mars_rover.direction, "Facing: #{mars_rover.direction}")
  end
end
