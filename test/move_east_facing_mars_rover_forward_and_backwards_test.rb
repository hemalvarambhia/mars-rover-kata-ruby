require 'minitest/autorun'
require_relative '../lib/mars_rover'
class Coordinates
  attr_reader :x, :y
  def initialize(x:, y:)
    @x = x
    @y = y
  end
end

class MoveEastFacingMarsRoverForwardAndBackwardsTest < Minitest::Test
  def test_no_command_moves_mars_rover_nowhere
    mars_rover = MarsRover.new(x: 0, y: 0)

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 0, y: 0), 0, 0, mars_rover)
  end

  def test_no_command_leaves_mars_rovers_position_unchanged
    mars_rover = MarsRover.new(x: 2, y: 1)

    mars_rover.execute('')

    assert_located_at(Coordinates.new(x: 2, y: 1), 2, 1, mars_rover)
  end

  def test_moving_one_step_forward_from_the_origin
    mars_rover = MarsRover.new(x: 0, y: 0)

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 1, y: 0), 1, 0, mars_rover)
  end

  def test_moving_one_step_backwards_from_any_position
    skip('Test list')
  end

  private

  def assert_located_at(coordinates, x, y, mars_rover)
    assert_equal(coordinates.x, mars_rover.x, "x-coordinate")
    assert_equal(coordinates.y, mars_rover.y, "y-coordinate")
  end
end