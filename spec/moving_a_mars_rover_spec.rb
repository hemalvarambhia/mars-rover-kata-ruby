require_relative '../lib/coordinates'
require_relative '../lib/location'
require_relative '../lib/mars_rover'
describe 'Moving a Mars rover' do
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
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'W', coordinates: Coordinates.new(x: 0, y: -2))),
        expected_coordinates: Coordinates.new(x: -1, y: -2)
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

    describe 'Travelling to the north pole' do
      # Assume:
      # 18 parallels: 9 parallels on the northern hemisphere, each 10 degrees apart, and another 9 in the southern hemisphere.
      # 36 meridians, each 10 degrees apart: The western hemisphere as 18, the eastern hemisphere also 18.
      # The north pole is 90 degrees N from Mars' equator and the south pole is 90 degrees S from Mars' equator
      # At the central meridian (0 degrees) North Pole is at P(0, 9) and South Pole P(0, -9)
      context 'when it reaches the north pole' do
        it 'faces south' do
          starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 8))
          mars_rover = MarsRover.new(starting_location: starting_location)

          mars_rover.execute(['f'])

          expect(mars_rover).to be_facing('S')
        end

        it 'moves to the same latitude but in the other half of the planet e.g. from (0, 8) to (18, 9)' do
          starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 8))
          mars_rover = MarsRover.new(starting_location: starting_location)

          mars_rover.execute(['f'])

          expect(mars_rover).to be_located_at(Coordinates.new(x: 18, y: 9))
        end

        it 'moves to the north pole from any line of longitude e.g. (1, 8) to (19, 9)' do
          starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 1, y: 8))
          mars_rover = MarsRover.new(starting_location: starting_location)

          mars_rover.execute(['f'])

          expect(mars_rover).to be_located_at(Coordinates.new(x: 19, y: 9))
        end
      end

      example 'landing on the north pole (0, 9) means it is now facing south'
    end

    describe 'Travelling to the south pole' do
      context 'when it reaches the south pole' do
        it 'faces north'
        it 'moves to the moves to the same latitude but in the other half of the planet from (0, -8) to (18, -8)'
      end

      example 'landing on the south pole (0, -9) means it is now facing south'
    end
  end

  describe 'Moving backwards' do
    %w{N E S W}.each do |direction|
      it "never changes direction when it moves backwards e.g . #{direction}" do
        starting_location = Location.new(direction: direction, coordinates: Coordinates.new(x: 1, y: 3))
        mars_rover = MarsRover.new(starting_location: starting_location)

        expect { mars_rover.execute(['b']) }.not_to change(mars_rover, :direction)
      end
    end

    [
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 0))),
        expected_coordinates: Coordinates.new(x: 0, y: -1)
      },
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'N', coordinates: Coordinates.new(x: 4, y: 1))),
        expected_coordinates: Coordinates.new(x: 4, y: 0),
      },
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'E', coordinates: Coordinates.new(x: 2, y: 0))),
        expected_coordinates: Coordinates.new(x: 1, y: 0)
      },
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'S', coordinates: Coordinates.new(x: 8, y: -1))),
        expected_coordinates: Coordinates.new(x: 8, y: 0)
      },
      {
        mars_rover: MarsRover.new(starting_location: Location.new(direction: 'W', coordinates: Coordinates.new(x: -1, y: 0))),
        expected_coordinates: Coordinates.new(x: 0, y: 0)
      }
    ].each do |row|
      it "#{row[:mars_rover]} moves backwards to #{row[:expected_coordinates]}" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['b'])

        expect(mars_rover).to be_located_at(row[:expected_coordinates])
      end
    end

    it 'moves backwards in multiple steps' do
      starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 4))
      mars_rover = MarsRover.new(starting_location: starting_location)

      mars_rover.execute(%w{b b b b})

      expected_coordinates = Coordinates.new(x: 0, y: 0)
      expect(mars_rover).to be_located_at(expected_coordinates)
    end
  end
end

RSpec::Matchers.define :be_located_at do |expected_position|
  match { |rover| rover.current_position == expected_position }
end

RSpec::Matchers.define :be_facing do |expected_direction|
  match { |rover| rover.direction == expected_direction}
end
