require 'ostruct'
require_relative '../lib/location'
module LocationAssertion
  private

  def assert_at_point(expected_coordinates, expected_direction, mars_rover)
    position = mars_rover.position
    expected_position =
      Location.new(
        coordinates: expected_coordinates,
        direction: expected_direction
      )
    assert_equal(expected_position, position)
  end
end
