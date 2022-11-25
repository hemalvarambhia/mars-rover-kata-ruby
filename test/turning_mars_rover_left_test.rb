require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'
class TurningMarsRoverLeftTest < Minitest::Test
  include LocationAssertion

  def test_turning_north_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: -1, y: 2, direction: nil),
        'N'
      )

    mars_rover.execute('l')

    expected_location = Position.new(x: -1, y: 2)
    assert_that(mars_rover, located_at: expected_location, facing: 'W')
  end

  def test_turning_east_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 1, y: -2, direction: nil),
        'E'
      )

    mars_rover.execute('l')

    expected_location = Position.new(x: 1, y: -2)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_turning_south_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 0, y: -2, direction: nil),
        'S'

      )

    mars_rover.execute('l')

    expected_location = Position.new(x: 0, y: -2)
    assert_that(mars_rover, located_at: expected_location, facing: 'E')
  end

  def test_turning_west_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 3, y: 3, direction: 'W'),
        'W'
      )

    mars_rover.execute('l')

    expected_location = Position.new(x: 3, y: 3)
    assert_that(mars_rover, located_at: expected_location, facing: 'S')
  end

  def test_turning_north_facing_mars_rover_twice
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: -1, y: 2, direction: nil),
        'N'
      )

    mars_rover.execute('ll')

    expected_location = Position.new(x: -1, y: 2)
    assert_that(mars_rover, located_at: expected_location, facing: 'S')
  end

  def test_turning_north_facing_mars_rover_four_times
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: -1, y: 2, direction: nil),
        'N'
      )

    mars_rover.execute('llll')

    expected_location = Position.new(x: -1, y: 2)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end
end
