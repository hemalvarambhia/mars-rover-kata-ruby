require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'
class TurningMarsRoverRightTest < Minitest::Test
  include LocationAssertion

  def test_turning_north_facing_mars_rover
    mars_rover = MarsRover.positioned_at(Planet.infinite, Position.new(x: 4, y: 1), 'N')

    mars_rover.execute('r')

    expected_location = Position.new(x: 4, y: 1)
    assert_that(mars_rover, located_at: expected_location, facing: 'E')
  end

  def test_turning_east_facing_mars_rover
    mars_rover = MarsRover.positioned_at(Planet.infinite, Position.new(x: 2, y: -3), 'E')

    mars_rover.execute('r')

    expected_location = Position.new(x: 2, y: -3)
    assert_that(mars_rover, located_at: expected_location, facing: 'S')
  end

  def test_turning_south_facing_mars_rover
    mars_rover = MarsRover.positioned_at(Planet.infinite, Position.new(x: 2, y: -3), 'S')

    mars_rover.execute('r')

    expected_location = Position.new(x: 2, y: -3)
    assert_that(mars_rover, located_at: expected_location, facing: 'W')
  end

  def test_turning_west_facing_mars_rover
    mars_rover = MarsRover.positioned_at(Planet.infinite, Position.new(x: 0, y: 0), 'W')

    mars_rover.execute('r')

    expected_location = Position.new(x: 0, y: 0)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_turning_north_facing_rover_twice
    mars_rover = MarsRover.positioned_at(Planet.infinite, Position.new(x: 3, y: 3), 'N')

    mars_rover.execute('rr')

    expected_location = Position.new(x: 3, y: 3)
    assert_that(mars_rover, located_at: expected_location, facing: 'S')
  end

  def test_turning_south_facing_rover_twice
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 2, y: 1),
        'S'
      )

    mars_rover.execute('rr')

    expected_location = Position.new(x: 2, y: 1)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end
end
