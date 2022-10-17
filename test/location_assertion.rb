require 'ostruct'
module LocationAssertion
  private

  def assert_at_point(expected_coordinates, expected_direction, mars_rover)
    point =
      OpenStruct.new(
        coordinates: mars_rover.coordinates,
        direction: mars_rover.direction
      )
    expected_point =
      OpenStruct.new(
        coordinates: expected_coordinates,
        direction: expected_direction
      )
    assert_equal(expected_point, point)
  end
end
