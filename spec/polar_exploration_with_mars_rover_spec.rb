require_relative '../lib/coordinates'
require_relative '../lib/location'
require 'mars_rover_set_up'
require_relative './mars_rover_matchers'
describe 'Moving forwards' do
  include MarsRoverMatchers, MarsRoverSetUp
  extend MarsRoverSetUp

  # Assume:
  # 18 parallels: 9 parallels on the northern hemisphere, each 10 degrees apart, and another 9 in the southern hemisphere.
  # 36 meridians, each 10 degrees apart: The western hemisphere as 18, the eastern hemisphere also 18.
  # The north pole is 90 degrees N from Mars' equator and the south pole is 90 degrees S from Mars' equator
  # At the central meridian (0 degrees) North Pole is at P(0, 9) and South Pole P(0, -9)
  context 'at the north pole P(x, 9)' do
    [
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 8))),
        expected_coordinates: Coordinates.new(x: 18, y: 8)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'N', coordinates: Coordinates.new(x: 1, y: 8))),
        expected_coordinates: Coordinates.new(x: 19, y: 8)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'N', coordinates: Coordinates.new(x: 18, y: 8))),
        expected_coordinates: Coordinates.new(x: 0, y: 8)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'N', coordinates: Coordinates.new(x: 19, y: 8))),
        expected_coordinates: Coordinates.new(x: 1, y: 8)
      }
    ].each do |row|
      it "moves to the same latitude but at the antimeridian e.g. from #{row[:mars_rover].current_position} to #{row[:expected_coordinates]} and faces south" do
        mars_rover = row[:mars_rover]

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(row[:expected_coordinates]).and be_facing('S')
      end
    end
  end

  context 'at the south pole P(x, -9)' do
    it 'moves to the same latitude but at the antimeridian, e.g. (0, -8) to (18, -8) and faces north' do
      starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 0, y: -8))
      mars_rover = mars_rover(starting_at: starting_location)

      mars_rover.execute(['f'])

      expect(mars_rover).to be_located_at(Coordinates.new(x: 18, y: -8)).and be_facing('N')
    end

    it 'moves to the same latitude at the antimeridian, e.g. (3, -8) to (21, -8) and faces north' do
      starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 3, y: -8))
      mars_rover = mars_rover(starting_at: starting_location)

      mars_rover.execute(['f'])

      expect(mars_rover).to be_located_at(Coordinates.new(x: 21, y: -8)).and be_facing('N')
    end

    it 'moves to the south pole at an antimeridian back to the prime meridian e.g. (18, -8) to (0, -8)' do
      starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 18, y: -8))
      mars_rover = mars_rover(starting_at: starting_location)

      mars_rover.execute(['f'])

      expect(mars_rover).to be_located_at(Coordinates.new(x: 0, y: -8)).and be_facing('N')
    end

    example 'starting at the equator, at the prime meridian and ending up at the north pole' do
      starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 0))
      mars_rover = mars_rover(starting_at: starting_location)

      mars_rover.execute(%w{f f f f f f f f f})

      expect(mars_rover).to be_located_at(Coordinates.new(x: 18, y: 8)).and be_facing('S')
    end
  end
end

describe 'Moving backwards' do
  include MarsRoverMatchers, MarsRoverSetUp
  extend MarsRoverSetUp

  context 'at the north pole' do
    context 'facing south' do
      it 'moves to the antimeridian of the current meridian and continues to face north' do
        starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 0, y: 8))
        mars_rover = mars_rover(starting_at: starting_location)

        mars_rover.execute(['b'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 18, y: 8)).and be_facing('N')
      end

      it 'moves to the meridian of the current antimeridian and continues to face north' do
        starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 18, y: 8))
        mars_rover = mars_rover(starting_at: starting_location)

        mars_rover.execute(['b'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 0, y: 8)).and be_facing('N')
      end
    end
  end

  context 'at south pole' do
    it 'moves to the antimeridian of the current meridian and continues to face south' do
      starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: -8))
      mars_rover = mars_rover(starting_at: starting_location)

      mars_rover.execute(['b'])

      expect(mars_rover).to be_located_at(Coordinates.new(x: 18, y: -8)).and be_facing('S')
    end

    it 'moves to the meridian of the current antimeridian and then faces south' do
      starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 18, y: -8))
      mars_rover = mars_rover(starting_at: starting_location)

      mars_rover.execute(['b'])

      expect(mars_rover).to be_located_at(Coordinates.new(x: 0, y: -8)).and be_facing('S')
    end
  end
end
