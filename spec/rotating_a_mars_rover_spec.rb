require_relative '../lib/coordinates'
require_relative '../lib/location'
require_relative '../lib/mars_rover'

describe 'Turning a mars rover' do
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

    context 'at the north pole' do
      it 'remains facing south'
    end

    context 'at the south pole' do
      it 'remains facing north'
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

    context 'when it reaches the north pole' do
      it 'remains facing south'
    end

    context 'when it reaches the south pole' do
      it 'remains facing north'
    end
  end

  RSpec::Matchers.define :be_located_at do |expected_position|
    match { |rover| rover.current_position == expected_position }
  end

  RSpec::Matchers.define :be_facing do |expected_direction|
    match { |rover| rover.direction == expected_direction}
  end
end

