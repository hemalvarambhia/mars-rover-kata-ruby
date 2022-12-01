require 'minitest/autorun'
require_relative '../lib/mars_rover'
require_relative '../lib/coordinates'

class OperatingAnEastFacingMarsRoverTest < Minitest::Test
  def test_no_command_moves_mars_rover_nowhere
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), orientation: 'E')

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 0, y: 0), mars_rover)
  end

  def test_no_command_leaves_mars_rovers_current_position_unchanged
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 2, y: 1), orientation: 'E')

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 2, y: 1), mars_rover)
  end

  def test_moving_one_step_forward_from_the_origin
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), orientation: 'E')

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 0), mars_rover)
  end

  def test_moving_forward_leaves_direction_unchanged
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), orientation: 'E')

    mars_rover.execute('f')

    assert_equal('E', mars_rover.orientation)
  end

  def test_moving_one_step_backwards_from_any_position
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 3, y: 5), orientation: 'E')

    mars_rover.execute('b')

    assert_located_at(Coordinates.new(x: 2, y: 5), mars_rover)
  end

  def test_turning_mars_rover_left_orients_it_northward
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), orientation: 'E')

    mars_rover.execute('l')

    assert_equal('N', mars_rover.orientation)
  end

  def test_turning_mars_rover_left_leaves_current_position_unchanged
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 5, y: -2), orientation: 'E')

    mars_rover.execute('l')

    assert_located_at(Coordinates.new(x: 5, y: -2), mars_rover)
  end

  def test_turning_mars_rover_right_orients_it_southward
    skip('Test list')
  end

  def test_turning_mars_rover_right_leaves_current_position_unchanged
    skip('Test list')
  end

  private

  def assert_located_at(coordinates, mars_rover)
    assert_equal(coordinates.x, mars_rover.x, "x-coordinate")
    assert_equal(coordinates.y, mars_rover.y, "y-coordinate")
  end
end