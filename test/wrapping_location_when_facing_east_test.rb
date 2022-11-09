require 'minitest/autorun'
require_relative './mars_rover_on_cartesian_coordinates'
require_relative './location_assertion'
class WrappingLocationWhenFacingEastTest < Minitest::Test
  include LocationAssertion

  def test_no_wrapping_when_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 0, y: 0, direction: 'E'))

    mars_rover.execute('f')

    expected_coordinate = Location.new(world: world, x: 1, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_to_the_right_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 3, y: 3, direction: 'E'))

    mars_rover.execute('f')

    expected_coordinate = Location.new(world: world, x: 4, y: 3, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_from_the_right_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 4, y: 0, direction: 'E'))

    mars_rover.execute('f')

    expected_coordinate = Location.new(world: world, x: -4, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_foward_past_the_right_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 3, y: 0, direction: 'E'))

    mars_rover.execute('ff')

    expected_coordinate = Location.new(world: world, x: -4, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_starting_away_from_origin_and_returning_to_origin
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 2, y: 0, direction: 'E'))

    mars_rover.execute('fffffff')

    expected_coordinate = Location.new(world: world, x: 0, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 2, y: 0, direction: 'E'))

    mars_rover.execute('b')

    expected_coordinate = Location.new(world: world, x: 1, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_to_the_left_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: -3, y: 0, direction: 'E'))

    mars_rover.execute('b')

    expected_coordinate = Location.new(world: world, x: -4, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_from_the_left_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: -4, y: 0, direction: 'E'))

    mars_rover.execute('b')

    expected_coordinate = Location.new(world: world, x: 4, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_past_the_left_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: -3, y: 0, direction: 'E'))

    mars_rover.execute('bbb')

    expected_coordinate = Location.new(world: world, x: 3, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end
end
