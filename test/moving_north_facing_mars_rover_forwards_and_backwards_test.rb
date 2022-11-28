require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'

class MovingNorthFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  include LocationAssertion

  def test_moving_nowhere
    mars_rover = mars_rover_facing_north(Planet.infinite, Position.new(x: 0, y: 0))

    mars_rover.execute('')

    expected_location = Position.new(x: 0, y: 0)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_moving_one_step_forward
    mars_rover = mars_rover_facing_north(Planet.infinite, Position.new(x: 0, y: 0))

    mars_rover.execute('f')

    expected_location = Position.new(x: 0, y: 1)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_moving_two_steps_forward
    mars_rover = mars_rover_facing_north(Planet.infinite, Position.new(x: 0, y: 0))

    mars_rover.execute('ff')

    expected_location = Position.new(x: 0, y: 2)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_moving_multiple_steps_forward
    mars_rover = mars_rover_facing_north(Planet.infinite, Position.new(x: 0, y: 0))

    mars_rover.execute('fff')

    expected_location = Position.new(x: 0, y: 3)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_rover_moves_back_one_step
    mars_rover = mars_rover_facing_north(Planet.infinite, Position.new(x: 2, y: 0))

    mars_rover.execute('b')

    expected_location = Position.new(x: 2, y: -1)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_rover_moves_multiple_steps_backward
    mars_rover = mars_rover_facing_north(Planet.infinite, Position.new(x: -3, y: 0))

    mars_rover.execute('bbbb')

    expected_location = Position.new(x: -3, y: -4)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_rover_moves_multiple_steps_forward_and_multiple_steps_backward
    mars_rover = mars_rover_facing_north(Planet.infinite, Position.new(x: 3, y: 0))

    mars_rover.execute('fffbb')

    expected_location = Position.new(x: 3, y: 1)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover = mars_rover_facing_north(Planet.infinite, Position.new(x: 1, y: 0))

    mars_rover.execute('z')

    expected_location = Position.new(x: 1, y: 0)
    assert_that(mars_rover, located_at: expected_location, facing: 'N')
  end

  def test_no_wrapping_when_moving_forward
    world = Planet.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = mars_rover_facing_north(world, Position.new(x: 2, y: 1))

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: 2, y: 2)
    assert_that(mars_rover, located_at: expected_coordinate, facing: 'N')
  end

  def test_moving_forward_to_the_top_edge
    world = Planet.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = mars_rover_facing_north(world, Position.new(x: 2, y: 3))

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: 2, y: 4)
    assert_that(mars_rover, located_at: expected_coordinate, facing: 'N')
  end

  def test_moving_forward_from_the_top_edge
    world = Planet.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = mars_rover_facing_north(world, Position.new(x: 3, y: 4))

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: 3, y: -4)
    assert_that(mars_rover, located_at: expected_coordinate, facing: 'N')
  end

  def test_moving_forward_past_the_top_edge
    world = Planet.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = mars_rover_facing_north(world, Position.new(x: 3, y: 3))

    mars_rover.execute('fff')

    expected_coordinate = Position.new(x: 3, y: -3)
    assert_that(mars_rover, located_at: expected_coordinate, facing: 'N')
  end

  def test_no_wrapping_when_moving_backward
    world = Planet.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = mars_rover_facing_north(world, Position.new(x: 0, y: 1))

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: 0, y: 0)
    assert_that(mars_rover, located_at: expected_coordinate, facing: 'N')
  end

  def test_moving_backward_to_the_bottom_edge
    world = Planet.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = mars_rover_facing_north(world, Position.new(x: 0, y: -3))

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: 0, y: -4)
    assert_that(mars_rover, located_at: expected_coordinate, facing: 'N')
  end

  def test_moving_backward_from_the_bottom_edge
    world = Planet.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = mars_rover_facing_north(world, Position.new(x: 1, y: -4))

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: 1, y: 4)
    assert_that(mars_rover, located_at: expected_coordinate, facing: 'N')
  end

  def test_moving_backward_past_the_bottom_edge
    world = Planet.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover = mars_rover_facing_north(world, Position.new(x: 0, y: -2))

    mars_rover.execute('bbbb')

    expected_coordinate = Position.new(x: 0, y: 3)
    assert_that(mars_rover, located_at: expected_coordinate, facing: 'N')
  end

  def test_rover_cannot_move_forward_when_there_is_an_obstacle_in_front
    world = Planet.new(x_range: (-4..4), y_range: (-4..4), obstacles: [Position.new(x: -2, y: 1)])
    mars_rover = mars_rover_facing_north(world, Position.new(x: -2, y: 0))

    mars_rover.execute('f')

    expected_coordinates = Position.new(x: -2, y: 0)
    assert_that(mars_rover, located_at: expected_coordinates, facing: 'N')
  end

  def test_rover_cannot_move_forward_past_top_edge_when_there_is_an_obstacle_at_bottom_edge
    world = Planet.new(x_range: (-5..5), y_range: (-5..5), obstacles: [Position.new(x: 0, y: -5)])
    mars_rover = mars_rover_facing_north(world, Position.new(x: 0, y: 5))

    mars_rover.execute('f')

    expected_coordinates = Position.new(x: 0, y: 5)
    assert_that(mars_rover, located_at: expected_coordinates, facing: 'N')
  end

  def test_rover_cannot_move_backward_when_there_is_an_obstacle_behind
    world = Planet.new(x_range: (-5..5), y_range: (-5..5), obstacles: [Position.new(x: 2, y: 0)])
    mars_rover = mars_rover_facing_north(world, Position.new(x: 2, y: 1))

    mars_rover.execute('b')

    expected_coordinates = Position.new(x: 2, y: 1)
    assert_that(mars_rover, located_at: expected_coordinates, facing: 'N')
  end

  def test_rover_cannot_move_backward_past_bottom_edge_when_there_is_an_obstacle_at_top_edge
    world = Planet.new(x_range: (-6..6), y_range: (-6..6), obstacles: [Position.new(x: 5, y: 6)])
    mars_rover = mars_rover_facing_north(world, Position.new(x: 5, y: -6))

    mars_rover.execute('b')

    expected_coordinates = Position.new(x: 5, y: -6)
    assert_that(mars_rover, located_at: expected_coordinates, facing: 'N')
  end

  private

  def mars_rover_facing_north(planet, position)
    MarsRover.positioned_at(planet, position, 'N')
  end
end
