require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'
RSpec.describe 'Operating a Mars rover' do

  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(x: 0, y: 0)

    expected_coordinate = Coordinate.new(x: 0, y: 0)
    expect(mars_rover.x).to(eq(expected_coordinate.x), "Expected Mars Rover's x-coordinate to be 0, but got #{mars_rover.x}")
    expect(mars_rover.y).to(eq(expected_coordinate.y), "Expected Mars Rover's y-coordinate to be 0, but got #{mars_rover.y}")
  end

  it 'has a starting position anywhere on the planet' do
    mars_rover = MarsRover.new(x: 2, y: 3)

    expected_coordinate = Coordinate.new(x: 2, y: 3)
    expect(mars_rover.x).to(eq(expected_coordinate.x), "Expected Mars Rover's x-coordinate to be 2, but got #{mars_rover.x}")
    expect(mars_rover.y).to(eq(expected_coordinate.y), "Expected Mars Rover's y-coordinate to be 3, but got #{mars_rover.y}")
  end

  it 'has a direction that it is facing' do
    mars_rover = MarsRover.new(x: 2, y: 3)

    expect(mars_rover.direction).to(eq('S'), "Expected Mars Rover to be facing 'S', but got ''#{mars_rover.direction}'")
  end

  it 'can face any direction' do
    mars_rover = MarsRover.new(x: 2, y: 3, direction: 'W')

    expect(mars_rover.direction).to(eq('W'), "Expected Mars Rover to be facing 'W', but got ''#{mars_rover.direction}'")
  end
end