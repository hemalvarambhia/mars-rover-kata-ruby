require 'minitest/autorun'
require_relative '../lib/mars_rover'
require_relative '../lib/coordinates'
class OperatingASouthFacingMarsRoverTest < Minitest::Test
  def test_moving_one_step_forward_from_the_origin
    mars_rover = MarsRover.new(starting_position: Coordinates.new(x: 0, y: 0), orientation: 'S')

    mars_rover.execute('f')

    assert_located_at(Coordinates.new(x: 0, y: -1), mars_rover)
  end

  def test_moving_forward_leaves_orientation_unchanged
    skip('Test list')
  end

  def test_moving_one_step_backwards_from_any_position
    skip('Test list')
  end

  def test_moving_backwards_leaves_orientation_unchanged
    skip('Test list')
  end

  private

  def assert_located_at(coordinates, mars_rover)
    assert_equal(coordinates, mars_rover.current_position, "Coordinates")
  end
end
