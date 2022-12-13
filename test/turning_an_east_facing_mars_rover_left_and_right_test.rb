require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'
class TurningAnEastFacingMarsRoverLeftAndRightTest < Minitest::Test
  include CoordinatesAssertion

  def test_turning_mars_rover_left_orients_it_northward
    mars_rover = mars_rover_oriented_eastward(nil, nil)

    mars_rover.execute('l')

    assert_equal('N', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    planet = Planet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 5, y: -2))

    mars_rover.execute('l')

    assert_located_at(Coordinates.new(x: 5, y: -2), mars_rover)
  end

  def test_turning_mars_rover_right_orients_it_southward
    mars_rover = mars_rover_oriented_eastward(nil, nil)

    mars_rover.execute('r')

    assert_equal('S', mars_rover.orientation, 'orientation')
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    planet = Planet.new(northern_edge: nil, eastern_edge: 5, southern_edge: nil, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 3))

    mars_rover.execute('r')

    assert_located_at(Coordinates.new(x: 0, y: 3), mars_rover)
  end

  private

  def mars_rover_oriented_eastward(planet, starting_position)
    mars_rover =
      MarsRover.new(
        planet: planet,
        starting_position: starting_position,
        orientation: 'E'
      )
    VehicleController.new(vehicle: mars_rover)
  end
end
