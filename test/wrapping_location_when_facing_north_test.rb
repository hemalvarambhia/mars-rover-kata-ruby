require 'minitest/autorun'
require_relative './mars_rover_on_cartesian_coordinates'
require_relative './location_assertion'
class WrappingLocationWhenFacingNorthTest < Minitest::Test
  include LocationAssertion

  def test_no_wrapping_when_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 2, y: 1, direction: 'N'))

    mars_rover.execute('f')

    expected_coordinate = Location.new(world: world, x: 2, y: 2, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_to_the_top_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 2, y: 3, direction: 'N'))

    mars_rover.execute('f')

    expected_coordinate = Location.new(world: world, x: 2, y: 4, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_from_the_top_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 3, y: 4, direction: 'N'))

    mars_rover.execute('f')

    expected_coordinate = Location.new(world: world, x: 3, y: -4, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_past_the_top_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 3, y: 3, direction: 'N'))

    mars_rover.execute('fff')

    expected_coordinate = Location.new(world: world, x: 3, y: -3, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 0, y: 1, direction: 'N'))

    mars_rover.execute('b')

    expected_coordinate = Location.new(world: world, x: 0, y: 0, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_to_the_bottom_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 0, y: -3, direction: 'N'))

    mars_rover.execute('b')

    expected_coordinate = Location.new(world: world, x: 0, y: -4, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_from_the_bottom_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 1, y: -4, direction: 'N'))

    mars_rover.execute('b')

    expected_coordinate = Location.new(world: world, x: 1, y: 4, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_past_the_bottom_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = MarsRover.positioned_at(Location.new(world: world, x: 0, y: -2, direction: 'N'))

    mars_rover.execute('bbbb')

    expected_coordinate = Location.new(world: world, x: 0, y: 3, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end
end
