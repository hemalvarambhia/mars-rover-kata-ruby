require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'

class OperatingAnEastFacingMarsRoverTest < Minitest::Test
  include CoordinatesAssertion

  def test_no_command_moves_mars_rover_nowhere
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 0, y: 0), mars_rover)
  end

  def test_no_command_leaves_mars_rovers_current_position_unchanged
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 2, y: 1))

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 2, y: 1), mars_rover)
  end

  def test_moving_one_step_forward_from_the_origin
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 0), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('f')

    assert_equal('E', mars_rover.orientation)
  end

  def test_moving_one_step_backwards_from_any_position
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 3, y: 5))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 2, y: 5), mars_rover)
  end

  def test_turning_mars_rover_left_orients_it_northward
    mars_rover = mars_rover_oriented_eastward(nil, nil)

    mars_rover.execute('l')

    assert_equal('N', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
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
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 3))

    mars_rover.execute('r')

    assert_located_at(Coordinates.new(x: 0, y: 3), mars_rover)
  end

  def test_an_unsupported_command_does_nothing_to_the_mars_rover
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 3, y: 2))

    mars_rover.execute('u')

    assert_located_at(Coordinates.new(x: 3, y: 2), mars_rover)
  end

  def test_moving_the_mars_rover_two_steps_forward
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 0, y: 2))

    mars_rover.execute('ff')

    assert_located_at(Coordinates.new(x: 2, y: 2), mars_rover)
  end

  def test_moving_forwards_to_the_eastern_edge
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 4, y: 1))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 5, y: 1), mars_rover)
  end

  def test_moving_forwards_from_the_eastern_edge
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 5, y: -2))

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: -5, y: -2), mars_rover)
  end


  def test_moving_backwards_past_the_eastern_edge
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5)
    mars_rover = mars_rover_oriented_eastward(planet, Coordinates.new(x: 3, y: -2))

    mars_rover.execute('fffff')

    assert_located_at(Coordinates.new(x: -3, y: -2), mars_rover)
  end

  def test_moving_backwards_to_the_western_edge
    skip('Test list')
  end

  def test_moving_backwards_from_the_western_edge
    skip('Test list')
  end

  private

  def mars_rover_oriented_eastward(planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5), starting_position)
    mars_rover =
      MarsRover.new(
        planet: planet,
        starting_position: starting_position,
        orientation: 'E'
      )
    VehicleController.new(vehicle: mars_rover)
  end
end