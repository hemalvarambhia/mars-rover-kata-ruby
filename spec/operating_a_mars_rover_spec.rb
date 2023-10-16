require_relative '../lib/coordinates'
require_relative '../lib/mars_rover'
RSpec.describe 'Operating a Mars rover' do
  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(direction: 'N', starting_position: Coordinates.new(x: 0, y: 0))

    expected_coordinate = Coordinates.new(x: 0, y: 0)
    expect(mars_rover).to be_located_at(expected_coordinate)
  end

  it 'has a starting position anywhere on the planet' do
    mars_rover = MarsRover.new(direction: 'S', starting_position: Coordinates.new(x: 2, y: 3))

    expected_coordinate = Coordinates.new(x: 2, y: 3)
    expect(mars_rover.current_position).to eq(expected_coordinate)
  end

  %w{N E S W}.each do |direction|
    it "can face any direction, including #{direction}" do
      mars_rover = MarsRover.new(direction: direction, starting_position: Coordinates.new(x: 2, y: -3))

      expect(mars_rover.direction).to(eq(direction), "Expected Mars Rover to be facing #{direction}, but got ''#{mars_rover.direction}'")
    end
  end

  it 'cannot be operated when it is facing any direction outside of N, E, S or W' do
    pending('Discussion with customer')
    expect { MarsRover.new(direction: 'Not N, E, S, W', starting_position: Coordinates.new(x: -2, y: -3)) }.to raise_error('A Mars rover has to be facing N, E, S or W')
  end

  it 'cannot be operated when a starting position is not provided' do
    pending('Discussion with customer')
    expect { MarsRover.new(direction: 'E', starting_position: nil) }.to raise_error('A Mars rover must be given a location to start from')
  end

  it 'receives commands from Earth' do
    mars_rover = MarsRover.new(direction: 'N', starting_position: Coordinates.new(x: 5, y: -7))
    expect(mars_rover).to respond_to(:execute).with(1)
  end

  describe 'Moving forwards' do
    it 'never changes direction when it moves forwards'
    it 'moves forwards when facing north' do
      mars_rover = MarsRover.new(direction: 'N', starting_position: Coordinates.new(x: 0, y: 0))

      mars_rover.execute(['f'])

      expected_coordinates = Coordinates.new(x: 0, y: 1)
      expect(mars_rover.current_position).to eq(expected_coordinates)
    end

    it 'moves forwards from any starting point when facing north' do
      mars_rover = MarsRover.new(direction: 'N', starting_position: Coordinates.new(x: 2, y: 3))

      mars_rover.execute(['f'])

      expected_coordinates = Coordinates.new(x: 2, y: 4)
      expect(mars_rover.current_position).to eq(expected_coordinates)
    end

    it 'can move forwards multiple times when facing north' do
      mars_rover = MarsRover.new(direction: 'N', starting_position: Coordinates.new(x: 2, y: 3))

      mars_rover.execute(['f', 'f', 'f'])

      expected_coordinates = Coordinates.new(x: 2, y: 6)
      expect(mars_rover.current_position).to eq(expected_coordinates)
    end

    it 'moves forwards when facing east' do
      pending 'Next test to get passing'
      mars_rover = MarsRover.new(direction: 'E', starting_position: Coordinates.new(x: 0, y: 0))

      mars_rover.execute(['f'])

      expected_coordinates = Coordinates.new(x: 1, y: 0)
      expect(mars_rover.current_position).to eq(expected_coordinates)
    end
    it 'moves forwards when facing south'
    it 'moves forwards when facing east'

    RSpec::Matchers.define :be_located_at do |expected_position|
      match do |rover|
        rover.current_position == expected_position
      end
    end
  end
end