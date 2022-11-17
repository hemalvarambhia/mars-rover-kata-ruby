require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'
class TurningMarsRoverLeftTest < Minitest::Test
  include LocationAssertion

  def test_turning_north_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: -1, y: 2, direction: 'N')
      )

    mars_rover.execute('l')

    expected_location = Position.new(x: -1, y: 2, direction: 'W')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_east_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 1, y: -2, direction: 'E')
      )

    mars_rover.execute('l')

    expected_location = Position.new(x: 1, y: -2, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_south_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 0, y: -2, direction: 'S')
      )

    mars_rover.execute('l')

    expected_location = Position.new(x: 0, y: -2, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_west_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 3, y: 3, direction: 'W')
      )

    mars_rover.execute('l')

    expected_location = Position.new(x: 3, y: 3, direction: 'S')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_north_facing_mars_rover_twice
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: -1, y: 2, direction: 'N')
      )

    mars_rover.execute('ll')

    expected_location = Position.new(x: -1, y: 2, direction: 'S')
    assert_located_at(expected_location, mars_rover)
  end

  def test_turning_north_facing_mars_rover_four_times
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: -1, y: 2, direction: 'N')
      )

    mars_rover.execute('llll')

    expected_location = Position.new(x: -1, y: 2, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end
end
