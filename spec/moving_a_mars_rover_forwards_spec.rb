require_relative '../lib/coordinates'
require_relative '../lib/location'
require_relative '../lib/mars_rover'
require_relative './mars_rover_matchers'
describe 'Moving a Mars rover' do
  include MarsRoverMatchers

  describe 'Moving forwards' do
    %w{N E S W}.each do |direction|
      it "never changes direction when it moves forwards e.g. remains facing #{direction}" do
        mars_rover =
          MarsRover.new(starting_location: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: direction))

        expect { mars_rover.execute(['f']) }.not_to change(mars_rover, :direction)
      end
    end

    [
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 0))),
        expected_coordinates: Coordinates.new(x: 0, y: 1)
      },
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'N', coordinates: Coordinates.new(x: 2, y: 3))),
        expected_coordinates: Coordinates.new(x: 2, y: 4)
      },
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'E', coordinates: Coordinates.new(x: 0, y: 0))),
        expected_coordinates: Coordinates.new(x: 1, y: 0)
      },
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'S', coordinates: Coordinates.new(x: -5, y: -1))),
        expected_coordinates: Coordinates.new(x: -5, y: -2)
      },
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'W', coordinates: Coordinates.new(x: 4, y: -2))),
        expected_coordinates: Coordinates.new(x: 3, y: -2)
      }
    ].each do |row|
      it "#{row[:mars_rover]} moves forwards to #{row[:expected_coordinates]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['f'])

        expected_coordinates = row[:expected_coordinates]
        expect(mars_rover).to be_located_at(expected_coordinates)
      end
    end

    it 'can move forwards multiple times when facing north' do
      starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 2, y: 3))
      mars_rover = MarsRover.new(starting_location: starting_location)

      mars_rover.execute(%w{f f f})

      expected_coordinates = Coordinates.new(x: 2, y: 6)
      expect(mars_rover).to be_located_at(expected_coordinates).and be_facing('N')
    end

    # Assume:
    # 18 parallels: 9 parallels on the northern hemisphere, each 10 degrees apart, and another 9 in the southern hemisphere.
    # 36 meridians, each 10 degrees apart: The western hemisphere as 18, the eastern hemisphere also 18.
    # The north pole is 90 degrees N from Mars' equator and the south pole is 90 degrees S from Mars' equator
    # At the central meridian (0 degrees) North Pole is at P(0, 9) and South Pole P(0, -9)
    context 'at the north pole P(x, 9)' do
      [
        {
          mars_rover: MarsRover.new(starting_location: Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 8))),
          expected_coordinates: Coordinates.new(x: 18, y: 8)
        },
        {
          mars_rover: MarsRover.new(starting_location: Location.new(direction: 'N', coordinates: Coordinates.new(x: 1, y: 8))),
          expected_coordinates: Coordinates.new(x: 19, y: 8)
        },
        {
          mars_rover: MarsRover.new(starting_location: Location.new(direction: 'N', coordinates: Coordinates.new(x: 18, y: 8))),
          expected_coordinates: Coordinates.new(x: 0, y: 8)
        },
        {
          mars_rover: MarsRover.new(starting_location: Location.new(direction: 'N', coordinates: Coordinates.new(x: 19, y: 8))),
          expected_coordinates: Coordinates.new(x: 1, y: 8)
        }
      ].each do |row|
        it "moves to the same latitude but at the antimeridian e.g. from #{row[:mars_rover].current_position} to #{row[:expected_coordinates]} and faces south" do
          mars_rover = row[:mars_rover]

          mars_rover.execute(['f'])

          expect(mars_rover).to be_located_at(row[:expected_coordinates]).and be_facing('S')
        end
      end

      example 'landing on the north pole (0, 9) means it is now facing south'
    end

    context 'at the south pole P(x, -9)' do
      it 'moves to the same latitude but at the antimeridian, e.g. (0, -8) to (18, -8) and faces north' do
        starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 0, y: -8))
        mars_rover = MarsRover.new(starting_location: starting_location)

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 18, y: -8)).and be_facing('N')
      end

      it 'moves to the same latitude at the antimeridian, e.g. (3, -8) to (21, -8) and faces north' do
        starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 3, y: -8))
        mars_rover = MarsRover.new(starting_location: starting_location)

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 21, y: -8)).and be_facing('N')
      end

      it 'moves to the south pole at an antimeridian back to the prime meridian e.g. (18, -8) to (0, -8)' do
        starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 18, y: -8))
        mars_rover = MarsRover.new(starting_location: starting_location)

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 0, y: -8)).and be_facing('N')
      end

      example 'starting at the equator, at the prime meridian and ending up at the north pole' do
        starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 0))
        mars_rover = MarsRover.new(starting_location: starting_location)

        mars_rover.execute(%w{f f f f f f f f f})

        expect(mars_rover).to be_located_at(Coordinates.new(x: 18, y: 8)).and be_facing('S')
      end
    end

    context 'at the edge of the western hemisphere' do
      it 'moves into the eastern hemisphere' do
        starting_location = Location.new(direction: 'E', coordinates: Coordinates.new(x: 35, y: 0))
        mars_rover = MarsRover.new(starting_location: starting_location)

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 0, y: 0)).and be_facing('E')
      end
    end

    context 'at the edge of the eastern hemisphere' do
      it 'moves into the western hemisphere' do
        starting_location = Location.new(direction: 'W', coordinates: Coordinates.new(x: 0, y: 0))
        mars_rover = MarsRover.new(starting_location: starting_location)

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 35, y: 0)).and be_facing('W')
      end
    end
  end
end
