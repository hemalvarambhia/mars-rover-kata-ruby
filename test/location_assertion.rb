require 'ostruct'
require_relative '../lib/location'
module LocationAssertion
  private

  def assert_located_at(expected_location, mars_rover)
    assert_equal(expected_location, mars_rover.position)
  end

  def assert_at_point(expected_coordinates, expected_direction, mars_rover)
    expected_position =
      Location.new(
        coordinates: expected_coordinates,
        direction: expected_direction
      )
    assert_located_at(expected_position, mars_rover)
  end
end
