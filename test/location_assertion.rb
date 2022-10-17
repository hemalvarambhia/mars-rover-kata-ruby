require 'ostruct'
module LocationAssertion
  private

  def assert_at_point(expected_coordinates, expected_direction, mars_rover)
    location = mars_rover.position
    expected_location =
      OpenStruct.new(
        coordinates: expected_coordinates,
        direction: expected_direction
      )
    assert_equal(expected_location, location)
  end
end
