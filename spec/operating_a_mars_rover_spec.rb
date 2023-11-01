require_relative '../lib/coordinates'
require_relative '../lib/location'
require_relative '../lib/mars_rover'
RSpec.describe 'Operating a Mars rover' do
  it 'has a starting position at the origin' do
    starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 0))
    mars_rover = MarsRover.new(starting_location: starting_location)

    expected_coordinate = Coordinates.new(x: 0, y: 0)
    expect(mars_rover).to be_located_at(expected_coordinate)
  end

  it 'has a starting position anywhere on the planet' do
    starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 2, y: 3))
    mars_rover = MarsRover.new(starting_location: starting_location)

    expected_coordinates = Coordinates.new(x: 2, y: 3)
    expect(mars_rover).to be_located_at(expected_coordinates)
  end

  %w{N E S W}.each do |direction|
    it "can face any direction, including #{direction}" do
      anywhere_facing_direction = Location.new(direction: direction, coordinates: Coordinates.new(x: 2, y: -3))
      mars_rover = MarsRover.new(starting_location: anywhere_facing_direction)

      expect(mars_rover.direction).to(eq(direction), "Expected Mars Rover to be facing #{direction}, but got ''#{mars_rover.direction}'")
    end
  end

  it 'cannot be operated when it is facing any direction outside of N, E, S or W' do
    pending('Discussion with customer')
    any_location = Location.new(coordinates: Coordinates.new(x: -2, y: -3), direction: 'Not N, E, S, W')
    expect { MarsRover.new(starting_location: any_location) }.to raise_error('A Mars rover has to be facing N, E, S or W')
  end

  it 'cannot be operated when a starting position is not provided' do
    pending('Discussion with customer')
    expect { MarsRover.new(starting_location: nil) }.to raise_error('A Mars rover must be given a location to start from')
  end

  def self.a_mars_rover_facing(direction:)
    location = Location.new(direction: direction, coordinates: Coordinates.new(x: 0, y: 0))
    MarsRover.new(starting_location: location)
  end

  describe 'Turning left' do
    [
      {
        mars_rover: a_mars_rover_facing(direction: 'N'),
        expected_orientation: 'W'
      },
      {
        mars_rover: a_mars_rover_facing(direction: 'E'),
        expected_orientation: 'N'
      },
      {
        mars_rover: a_mars_rover_facing(direction: 'S'),
        expected_orientation: 'E'
      },
      {
        mars_rover: a_mars_rover_facing(direction: 'W'),
        expected_orientation: 'S'
      }
    ].each do |row|
      example "a mars rover facing #{row[:mars_rover].direction} turns left to face #{row[:expected_orientation]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['l'])

        expect(mars_rover).to be_facing row[:expected_orientation]
      end
    end

    it 'does not change the current position' do
      any_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: -1, y: 3))
      mars_rover = MarsRover.new(starting_location: any_location)

      expect { mars_rover.execute(['l']) }.not_to change(mars_rover, :current_position)
    end

    it 'can rotate left multiple times' do
      any_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: -1, y: 3))
      mars_rover = MarsRover.new(starting_location: any_location)

      expect { mars_rover.execute(%w{l l l}) }.to change(mars_rover, :direction).from('N').to('E')
    end
  end

  describe 'Turning right' do
    [
      {
        mars_rover: a_mars_rover_facing(direction: 'N'),
        expected_orientation: 'E'
      },
      {
        mars_rover: a_mars_rover_facing(direction: 'E'),
        expected_orientation: 'S'
      },
      {
        mars_rover: a_mars_rover_facing(direction: 'S'),
        expected_orientation: 'W'
      },
      {
        mars_rover: a_mars_rover_facing(direction: 'W'),
        expected_orientation: 'N'
      }
    ].each do |row|
      example "when facing #{row[:mars_rover].direction}, it turns right to face #{row[:expected_orientation]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['r'])

        expect(mars_rover).to be_facing(row[:expected_orientation])
      end
    end

    example 'the Mars rover does not change its current position' do
      starting_location = Location.new(coordinates: Coordinates.new(x: 1, y: 2), direction: 'E')
      mars_rover = MarsRover.new(starting_location: starting_location)

      expect { mars_rover.execute(['r']) }.not_to change(mars_rover, :current_position)
    end

    example 'the Mars rover can rotate right multiple times' do
      starting_location = Location.new(coordinates: Coordinates.new(x: -1, y: 3), direction: 'W')
      mars_rover = MarsRover.new(starting_location: starting_location)

      expect { mars_rover.execute(%w{r r}) }.to change(mars_rover, :direction).from('W').to 'E'
    end
  end

  RSpec::Matchers.define :be_located_at do |expected_position|
    match { |rover| rover.current_position == expected_position }
  end

  RSpec::Matchers.define :be_facing do |expected_direction|
    match { |rover| rover.direction == expected_direction}
  end
end