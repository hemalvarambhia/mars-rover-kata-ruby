require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'
class MarsRoverMakingARectangleTest < Minitest::Test
  include LocationAssertion

  def test_making_a_rectangle
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: -2, y: 1, direction: nil),
        'S'
      )

    mars_rover.execute('fflfffflfflffff')

    expected_location = Position.new(x: -2, y: 1, direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end
end
