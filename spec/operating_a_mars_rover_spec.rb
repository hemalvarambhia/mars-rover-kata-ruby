require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'
RSpec.describe 'Operating a Mars rover' do

  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(x: 0, y: 0, direction: 'N')

    expected_coordinate = Coordinate.new(x: 0, y: 0)
    expect(mars_rover.x).to(eq(expected_coordinate.x), "Expected Mars Rover's x-coordinate to be 0, but got #{mars_rover.x}")
    expect(mars_rover.y).to(eq(expected_coordinate.y), "Expected Mars Rover's y-coordinate to be 0, but got #{mars_rover.y}")
  end

  it 'has a starting position anywhere on the planet' do
    mars_rover = MarsRover.new(x: 2, y: 3, direction: 'S')

    expected_coordinate = Coordinate.new(x: 2, y: 3)
    expect(mars_rover.x).to(eq(expected_coordinate.x), "Expected Mars Rover's x-coordinate to be 2, but got #{mars_rover.x}")
    expect(mars_rover.y).to(eq(expected_coordinate.y), "Expected Mars Rover's y-coordinate to be 3, but got #{mars_rover.y}")
  end

  %w{N E S W}.each do |direction|
    it "can face any direction, including #{direction}" do
      mars_rover = MarsRover.new(x: 2, y: 3, direction: direction)

      expect(mars_rover.direction).to(eq(direction), "Expected Mars Rover to be facing #{direction}, but got ''#{mars_rover.direction}'")
    end
  end
end