require 'ostruct'
module LocationAssertion
  private

  def assert_at_point(expected_coordinates, expected_direction, mars_rover)
    position = mars_rover.position
    expected_position =
      OpenStruct.new(
        coordinates: expected_coordinates,
        direction: expected_direction
      )
    assert_equal(expected_position, position)
  end
end
