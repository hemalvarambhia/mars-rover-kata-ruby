require 'minitest/autorun'
require_relative './mars_rover_in_cartesian_coordinate_system'
class MovingANorthFacingMarsRoverBackwardsTest < Minitest::Test
  include CoordinatesAssertion

  def test_no_command_moves_mars_rover_nowhere
    mars_rover = mars_rover_oriented_northward(nil, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 0, y: 0), mars_rover)
  end

  def test_moving_one_step_backwards_from_any_position
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 2, y: 1))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 2, y: 0), mars_rover)
  end

  def test_moving_backwards_leaves_orientation_unchanged
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 0, y: 1))

    mars_rover.execute('b')

    assert_equal('N', mars_rover.orientation)
  end

  def test_an_unsupported_command_does_nothing_to_the_mars_rover
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 4, y: 1))

    mars_rover.execute('x')

    assert_located_at(Coordinates.new(x: 4, y: 1), mars_rover)
  end

  def test_moving_the_mars_rover_two_steps_backwards
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil)
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 2, y: -2))

    mars_rover.execute('bb')

    assert_located_at(Coordinates.new(x: 2, y: -4), mars_rover)
  end

  def test_moving_backwards_to_the_southern_edge
    mars_rover =
      mars_rover_oriented_northward(
        Planet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil),
        Coordinates.new(x: 1, y: -5)
      )

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 1, y: -6), mars_rover)
  end

  def test_moving_backwards_from_the_southern_edge
    mars_rover =
      mars_rover_oriented_northward(
        Planet.new(northern_edge: 6, eastern_edge: nil, southern_edge: -6, western_edge: nil),
        Coordinates.new(x: 1, y: -6)
      )

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 1, y: 6), mars_rover)
  end

  def test_mars_rover_cannot_move_backwards_when_obstacle_is_behind_it
    planet = Planet.new(northern_edge: 5, eastern_edge: 5, southern_edge: -5, western_edge: -5, obstacles: [Coordinates.new(x: 0, y: -1)])
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 0, y: 0))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 0, y: 0), mars_rover)
  end

  def test_mars_rover_can_move_backwards_up_to_an_obstacle_and_not_beyond
    planet = Planet.new(northern_edge: 7, eastern_edge: 7, southern_edge: -6, western_edge: -6, obstacles: [Coordinates.new(x: 1, y: -5)])
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 1, y: -2))

    mars_rover.execute('bbbbb')

    assert_located_at(Coordinates.new(x: 1, y: -4), mars_rover)
  end

  def test_mars_rover_can_move_backwards_when_obstacle_is_adjacent
    skip('Test list')
  end

  def test_mars_rover_cannot_move_past_southern_edge_when_obstacle_is_located_on_northern_edge
    planet = Planet.new(northern_edge: 5, eastern_edge: nil, southern_edge: -5, western_edge: nil, obstacles: [Coordinates.new(x: 1, y: 5)])
    mars_rover = mars_rover_oriented_northward(planet, Coordinates.new(x: 1, y: -5))

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 1, y: -5), mars_rover)
  end

  private

  def mars_rover_oriented_northward(planet, starting_position)
    VehicleController.new(
      vehicle: MarsRover.new(
        planet: planet,
        starting_position: starting_position, orientation: 'N')
    )
  end
end
