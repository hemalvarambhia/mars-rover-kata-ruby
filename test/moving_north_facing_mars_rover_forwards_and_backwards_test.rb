require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'

class MovingNorthFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  include LocationAssertion

  def test_moving_nowhere
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 0, y: 0, direction: 'N')
      )

    mars_rover.execute('')

    expected_location = Position.new(x: 0, y: 0, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 0, y: 0, direction: 'N')
      )

    mars_rover.execute('f')

    expected_location = Position.new(x: 0, y: 1, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_two_steps_forward
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 0, y: 0, direction: 'N')
      )

    mars_rover.execute('ff')

    expected_location = Position.new(x: 0, y: 2, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_multiple_steps_forward
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 0, y: 0, direction: 'N')
      )

    mars_rover.execute('fff')

    expected_location = Position.new(x: 0, y: 3, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_back_one_step
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 2, y: 0, direction: 'N')
      )

    mars_rover.execute('b')

    expected_location = Position.new(x: 2, y: -1, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_multiple_steps_backward
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: -3, y: 0, direction: 'N')
      )

    mars_rover.execute('bbbb')

    expected_location = Position.new(x: -3, y: -4, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_multiple_steps_forward_and_multiple_steps_backward
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 3, y: 0, direction: 'N')
      )

    mars_rover.execute('fffbb')

    expected_location = Position.new(x: 3, y: 1, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 1, y: 0, direction: 'N')
      )

    mars_rover.execute('z')

    expected_location = Position.new(x: 1, y: 0, direction: 'N')
    assert_located_at(expected_location, mars_rover)
  end

  def test_no_wrapping_when_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 2, y: 1, direction: 'N')
      )

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: 2, y: 2, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_to_the_top_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 2, y: 3, direction: 'N')
      )

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: 2, y: 4, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_from_the_top_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 3, y: 4, direction: 'N')
      )

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: 3, y: -4, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_past_the_top_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 3, y: 3, direction: 'N')
      )

    mars_rover.execute('fff')

    expected_coordinate = Position.new(x: 3, y: -3, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 0, y: 1, direction: 'N')
      )

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: 0, y: 0, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_to_the_bottom_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 0, y: -3, direction: 'N')
      )

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: 0, y: -4, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_from_the_bottom_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 1, y: -4, direction: 'N')
      )

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: 1, y: 4, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_past_the_bottom_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 0, y: -2, direction: 'N')
      )

    mars_rover.execute('bbbb')

    expected_coordinate = Position.new(x: 0, y: 3, direction: 'N')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_rover_cannot_move_forward_when_there_is_an_obstable_in_front
    world = World.new(x_range: (-4..4), y_range: (-4..4), obstacles: [Position.new(x: -2, y: 1, direction: 'N')])
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: -2, y: 0, direction: 'N')
      )

    mars_rover.execute('f')

    expected_coordinates = Position.new(x: -2, y: 0, direction: 'N')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_rover_cannot_move_forward_past_top_edge_when_there_is_an_obstable_at_bottom_edge
    world = World.new(x_range: (-5..5), y_range: (-5..5), obstacles: [Position.new(x: 0, y: -5, direction: 'N')])

    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 0, y: 5, direction: 'N')
      )

    mars_rover.execute('f')

    expected_coordinates = Position.new(x: 0, y: 5, direction: 'N')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_rover_cannot_move_backward_when_there_is_an_obstacle_behind
    world = World.new(x_range: (-5..5), y_range: (-5..5), obstacles: [Position.new(x: 2, y: 0, direction: 'N')])
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 2, y: 1, direction: 'N')
      )

    mars_rover.execute('b')

    expected_coordinates = Position.new(x: 2, y: 1, direction: 'N')
    assert_located_at(expected_coordinates, mars_rover)
  end

  def test_rover_cannot_move_backward_past_bottom_edge_when_there_is_an_obstacle_at_top_edge
    world = World.new(x_range: (-6..6), y_range: (-6..6), obstacles: [Position.new(x: 5, y: 6, direction: 'N')])
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 5, y: -6, direction: 'N')
      )

    mars_rover.execute('b')

    expected_coordinates = Position.new(x: 5, y: -6, direction: 'N')
    assert_located_at(expected_coordinates, mars_rover)
  end
end
