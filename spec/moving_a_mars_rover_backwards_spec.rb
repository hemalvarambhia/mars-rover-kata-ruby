require_relative '../lib/coordinates'
require_relative '../lib/location'
require_relative '../lib/mars_rover'
require 'mars_rover_set_up'
require_relative './mars_rover_matchers'
describe 'Moving a Mars rover' do
  include MarsRoverMatchers, MarsRoverSetUp

  def self.mars_rover(on: Map.with_no_obstacles, obstacle_detector: ObstacleDetector.new(on.obstacles), starting_at:)
    MarsRover.new(map: on, obstacle_detector: obstacle_detector, starting_location: starting_at)
  end

  describe 'Moving backwards' do
    %w{N E S W}.each do |direction|
      it "never changes direction when it moves backwards e.g . #{direction}" do
        starting_location = Location.new(direction: direction, coordinates: Coordinates.new(x: 1, y: 3))
        mars_rover = mars_rover(starting_at: starting_location)

        expect { mars_rover.execute(['b']) }.not_to change(mars_rover, :direction)
      end
    end

    [
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 0))),
        expected_coordinates: Coordinates.new(x: 0, y: -1)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'N', coordinates: Coordinates.new(x: 4, y: 1))),
        expected_coordinates: Coordinates.new(x: 4, y: 0),
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'E', coordinates: Coordinates.new(x: 2, y: 0))),
        expected_coordinates: Coordinates.new(x: 1, y: 0)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'S', coordinates: Coordinates.new(x: 8, y: -1))),
        expected_coordinates: Coordinates.new(x: 8, y: 0)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'W', coordinates: Coordinates.new(x: 5, y: 0))),
        expected_coordinates: Coordinates.new(x: 6, y: 0)
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
      mars_rover = mars_rover(starting_at: starting_location)

      mars_rover.execute(%w{b b b b})

      expected_coordinates = Coordinates.new(x: 0, y: 0)
      expect(mars_rover).to be_located_at(expected_coordinates)
    end

    describe 'encountering obstacles' do
      it 'moves to the last point before the obstacle and reports the coordinates of it' do
        pending 'Next test to get passing'
        starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 1, y: 3))
        mars_rover = mars_rover(starting_at: starting_location)

        command_output = mars_rover.execute(['b'])

        expect(command_output).to eq('Obstacle: (1, 2)')
      end
    end

    context 'at the edge of the western hemisphere' do
      it 'moves into the eastern hemisphere' do
        starting_location = Location.new(direction: 'W', coordinates: Coordinates.new(x: 35, y: 5))
        mars_rover = mars_rover(starting_at: starting_location)

        mars_rover.execute(['b'])

        expected_coordinates = Coordinates.new(x: 0, y: 5)
        expect(mars_rover).to be_located_at(expected_coordinates)
      end
    end

    context 'at the edge of the eastern hemisphere' do
      it 'moves into the western hemisphere' do
        starting_location = Location.new(direction: 'E', coordinates: Coordinates.new(x: 0, y: -1))
        mars_rover = mars_rover(starting_at: starting_location)

        mars_rover.execute(['b'])

        expected_coordinates = Coordinates.new(x: 35, y: -1)
        expect(mars_rover).to be_located_at(expected_coordinates)
      end
    end

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
end
