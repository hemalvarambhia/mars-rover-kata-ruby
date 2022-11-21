require 'minitest/autorun'
require_relative './location_assertion'
require_relative './mars_rover_on_cartesian_coordinates'

class MovingEastFacingMarsRoverForwardsAndBackwardsTest < MiniTest::Test
  include LocationAssertion

  def test_moving_nowhere
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: -1, y: -1, direction: 'E')
      )

    mars_rover.execute('')

    expected_location = Position.new(x: -1, y: -1, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_forward
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 0, y: 0, direction: 'E')
      )

    mars_rover.execute('f')

    expected_location = Position.new(x: 1, y: 0, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_one_step_backward
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 2, y: 2, direction: 'E')
      )

    mars_rover.execute('b')

    expected_location = Position.new(x: 1, y: 2, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_moving_multiple_steps_forwards_and_multiple_steps_backwards
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: 0, y: 4, direction: 'E')
      )

    mars_rover.execute('ffbbb')

    expected_location = Position.new(x: -1, y: 4, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_rover_moves_nowhere_for_any_unrecognised_command
    mars_rover =
      MarsRover.positioned_at(
        World.infinite,
        Position.new(x: -3, y: -2, direction: 'E')
      )

    mars_rover.execute('z')

    expected_location = Position.new(x: -3, y: -2, direction: 'E')
    assert_located_at(expected_location, mars_rover)
  end

  def test_no_wrapping_when_moving_forward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 1, y: 0, direction: 'E')
      )

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: 2, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_to_the_right_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 3, y: 3, direction: 'E')
      )

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: 4, y: 3, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_from_the_right_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 4, y: 0, direction: 'E'))

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: -4, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_forward_past_the_right_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 3, y: 0, direction: 'E')
      )

    mars_rover.execute('ff')

    expected_coordinate = Position.new(x: -4, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_starting_away_from_origin_and_returning_to_origin
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 2, y: 0, direction: 'E')
      )

    mars_rover.execute('fffffff')

    expected_coordinate = Position.new(x: 0, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_no_wrapping_when_moving_backward
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 2, y: 0, direction: 'E')
      )

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: 1, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_to_the_left_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: -3, y: 0, direction: 'E')
      )

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: -4, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_from_the_left_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: -4, y: 0, direction: 'E')
      )

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: 4, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_backward_past_the_left_hand_edge
    world = World.new(x_range: (-4..4), y_range: (-4..4))
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: -3, y: 0, direction: 'E')
      )

    mars_rover.execute('bbb')

    expected_coordinate = Position.new(x: 3, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_nowhere_when_obstacle_is_adjacent_and_in_front
    world = World.new(x_range: (-4..4), y_range: (-4..4), obstacles: [Position.new(x: -2, y: 0, direction: 'E')])
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: -3, y: 0, direction: 'E')
      )

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: -3, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_one_step_forward_before_encountering_an_obstacle
    world = World.new(x_range: (-4..4), y_range: (-4..4), obstacles: [Position.new(x: -2, y: 0, direction: 'E')])
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: -4, y: 0, direction: 'E')
      )

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: -3, y: 0, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_two_steps_forward_before_encountering_an_obstacle
    world = World.new(x_range: (-10..10), y_range: (-10..10), obstacles: [Position.new(x: 5, y: 2, direction: 'E')])
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 2, y: 2, direction: 'E')
      )

    mars_rover.execute('ff')

    expected_coordinate = Position.new(x: 4, y: 2, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_rover_cannot_forward_beyond_right_hand_edge_when_left_hand_edge_has_an_obstable
    world = World.new(x_range: (-4..4), y_range: (-4..4), obstacles: [Position.new(x: -4, y: -1, direction: 'E')])
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 4, y: -1, direction: 'E')
      )

    mars_rover.execute('f')

    expected_coordinate = Position.new(x: 4, y: -1, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_we_cannot_move_one_step_backward_when_an_obstacle_is_adjacent
    world = World.new(x_range: (-10..10), y_range: (-10..10), obstacles: [Position.new(x: -1, y: -1, direction: 'E')])
    mars_rover =
      MarsRover.positioned_at(
        world,
        Position.new(x: 0, y: -1, direction: 'E')
      )

    mars_rover.execute('b')

    expected_coordinate = Position.new(x: 0, y: -1, direction: 'E')
    assert_located_at(expected_coordinate, mars_rover)
  end

  def test_moving_two_steps_backward_before_encountering_an_obstacle
    skip('Test list')
  end

  def test_rover_cannot_move_backwards_past_left_hand_edge_when_it_has_an_obstacle
    skip('Test list')
  end
end
