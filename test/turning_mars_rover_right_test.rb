require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'
class TurningMarsRoverRightTest < Minitest::Test
  include LocationAssertion

  def test_turning_north_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 4, y: 1, direction: 'N')
      )

    mars_rover.execute('r')

    expected_location = Position.new(x: 4, y: 1, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_east_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 2, y: -3, direction: 'E')
      )

    mars_rover.execute('r')

    expected_location = Position.new(x: 2, y: -3, direction: 'S')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_south_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 2, y: -3, direction: 'S')
      )

    mars_rover.execute('r')

    expected_location = Position.new(x: 2, y: -3, direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_west_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 0, y: 0, direction: 'W')
      )

    mars_rover.execute('r')

    expected_location = Position.new(x: 0, y: 0, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_north_facing_rover_twice
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 3, y: 3, direction: nil),
        'N'
      )

    mars_rover.execute('rr')

    expected_location = Position.new(x: 3, y: 3, direction: 'S')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_south_facing_rover_twice
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 2, y: 1, direction: nil),
        'S'
      )

    mars_rover.execute('rr')

    expected_location = Position.new(x: 2, y: 1, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end
end
