require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'

class GettingCurrentPositionAndDirectionOfMarsRoverTest < MiniTest::Test
  include LocationAssertion

  def test_current_position_and_direction_of_north_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 0, y: 0),
        'N'
      )

    expected_location = Position.new(x: 0, y: 0)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_x_axis
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 1, y: 0),
        'N'
      )

    expected_location = Position.new(x: 1, y: 0)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_current_position_of_north_facing_mars_rover_anywhere_on_y_axis
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 0, y: 5),
        'N'
      )

    expected_location = Position.new(x: 0, y: 5)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_current_position_and_direction_of_east_facing_mars_rover
    mars_rover =
      MarsRover.positioned_at(
        Planet.infinite,
        Position.new(x: 0, y: 0),
        'E'
      )

    expected_location = Position.new(x: 0, y: 0)
    assert_that(mars_rover, located_at: expected_location, facing: 'E')
  end
end
