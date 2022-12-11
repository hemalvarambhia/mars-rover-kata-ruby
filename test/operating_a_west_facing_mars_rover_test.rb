require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'
class OperatingAWestFacingMarsRoverTest < Minitest::Test
  include CoordinatesAssertion

  def test_moving_one_step_forward_from_the_origin
    mars_rover = west_facing_mars_rover(Coordinates.new(x: 2, y: 2))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 2), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    mars_rover = west_facing_mars_rover(Coordinates.new(x: 2, y: 2))

    mars_rover.execute('f')

    assert_equal('W', mars_rover.orientation)
  end

  def test_moving_one_step_backwards_from_any_position
    mars_rover = west_facing_mars_rover(Coordinates.new(x: 0, y: 0))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 1, y: 0), mars_rover)
  end

  def test_turning_mars_rover_left_orients_it_southward
    mars_rover = west_facing_mars_rover(nil)

    mars_rover.execute('l')

    assert_equal('S', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    mars_rover = west_facing_mars_rover(Coordinates.new(x: 1, y: 3))

    mars_rover.execute('l')

    assert_located_at(Coordinates.new(x: 1, y: 3), mars_rover)
  end

  def test_turning_mars_rover_right_orients_it_northward
    mars_rover = west_facing_mars_rover(nil)

    mars_rover.execute('r')

    assert_equal('N', mars_rover.orientation)
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    mars_rover = west_facing_mars_rover(Coordinates.new(x: -1, y: -3))

    mars_rover.execute('r')

    assert_located_at(Coordinates.new(x: -1, y: -3), mars_rover)
  end

  def test_moving_forward_from_the_western_edge
    planet = Planet.new(northern_edge: nil, eastern_edge: 7, southern_edge: nil, western_edge: -7)
    mars_rover = west_facing_mars_rover(planet, Coordinates.new(x: -7, y: -1))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 7, y: -1), mars_rover)
  end

  def test_moving_forward_past_the_western_edge
    planet = Planet.new(northern_edge: nil, eastern_edge: 7, southern_edge: nil, western_edge: -7)
    mars_rover = west_facing_mars_rover(planet, Coordinates.new(x: -5, y: -1))

    mars_rover.execute('ffff')

    assert_located_at(Coordinates.new(x: 6, y: -1), mars_rover)
  end

  def test_moving_backwards_from_the_eastern_edge
    planet = Planet.new(northern_edge: nil, eastern_edge: 4, southern_edge: nil, western_edge: -4)
    mars_rover = west_facing_mars_rover(planet, Coordinates.new(x: 4, y: 0))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: -4, y: 0), mars_rover)
  end

  def test_moving_backwards_past_the_eastern_edge
    skip('Test list')
  end

  def west_facing_mars_rover(planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5), starting_position)
    mars_rover = MarsRover.new(planet: planet, starting_position: starting_position, orientation: 'W')
    VehicleController.new(vehicle: mars_rover)
  end
end
