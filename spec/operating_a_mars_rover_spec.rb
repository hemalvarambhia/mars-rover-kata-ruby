require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'
RSpec.describe 'Operating a Mars rover' do

  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(x: 0, y: 0, direction: 'N', starting_position: Coordinates.new(x: 0, y: 0))

    expected_coordinate = Coordinates.new(x: 0, y: 0)
    expect(mars_rover.x).to(eq(expected_coordinate.x), "Expected Mars Rover's x-coordinate to be 0, but got #{mars_rover.x}")
    expect(mars_rover.y).to(eq(expected_coordinate.y), "Expected Mars Rover's y-coordinate to be 0, but got #{mars_rover.y}")
  end

  it 'has a starting position anywhere on the planet' do
    mars_rover = MarsRover.new(x: 2, y: 3, direction: 'S', starting_position: Coordinates.new(x: 2, y: 3))

    expected_coordinate = Coordinates.new(x: 2, y: 3)
    expect(mars_rover.x).to(eq(expected_coordinate.x), "Expected Mars Rover's x-coordinate to be 2, but got #{mars_rover.x}")
    expect(mars_rover.y).to(eq(expected_coordinate.y), "Expected Mars Rover's y-coordinate to be 3, but got #{mars_rover.y}")
  end

  %w{N E S W}.each do |direction|
    it "can face any direction, including #{direction}" do
      mars_rover = MarsRover.new(x: 2, y: 3, direction: direction, starting_position: Coordinates.new(x: 2, y: -3))

      expect(mars_rover.direction).to(eq(direction), "Expected Mars Rover to be facing #{direction}, but got ''#{mars_rover.direction}'")
    end
  end

  it 'cannot be facing any direction outside of N, E, S or W' do
    pending('Discuss with customer')
    expect { MarsRover.new(x: 2, y: 3, direction: 'Not N, E, S, W', starting_position: Coordinates.new(x: -2, y: -3)) }.to raise_error('A Mars rover has to be facing N, E, S or W')
  end

  it 'must be given a location to start from' do
    pending('Discuss with customer')
    expect { MarsRover.new(x: nil, y: nil, direction: 'E', starting_position: Coordinates.new(x: 1, y: 1)) }.to raise_error('A Mars rover must be given a location to start from')
  end
end