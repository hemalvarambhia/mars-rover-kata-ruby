require 'ostruct'
module LocationAssertion
  private

  def assert_at_point(expected_coordinates, expected_direction, mars_rover)
    point = OpenStruct.new(
              coordinates: mars_rover.coordinates,
              direction: mars_rover.direction
            )
    assert_equal(expected_coordinates, point.coordinates)
    assert_equal(expected_direction, point.direction)
  end
end
