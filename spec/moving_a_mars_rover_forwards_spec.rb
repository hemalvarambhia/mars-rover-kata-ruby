require_relative '../lib/coordinates'
require_relative '../lib/location'
require 'mars_rover_set_up'
require_relative './mars_rover_matchers'
describe 'Moving a Mars rover' do
  include MarsRoverMatchers, MarsRoverSetUp
  extend MarsRoverSetUp

  describe 'Moving forwards' do
    %w{N E S W}.each do |direction|
      it "never changes direction when it moves forwards e.g. remains facing #{direction}" do
        mars_rover =
          mars_rover(starting_at: Location.new(coordinates: Coordinates.new(x: 0, y: 0), direction: direction))

        expect { mars_rover.execute(['f']) }.not_to change(mars_rover, :direction)
      end
    end

    [
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 0))),
        expected_coordinates: Coordinates.new(x: 0, y: 1)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'N', coordinates: Coordinates.new(x: 2, y: 3))),
        expected_coordinates: Coordinates.new(x: 2, y: 4)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'E', coordinates: Coordinates.new(x: 0, y: 0))),
        expected_coordinates: Coordinates.new(x: 1, y: 0)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'S', coordinates: Coordinates.new(x: -5, y: -1))),
        expected_coordinates: Coordinates.new(x: -5, y: -2)
      },
      {
        mars_rover: mars_rover(starting_at: Location.new(direction: 'W', coordinates: Coordinates.new(x: 4, y: -2))),
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
      mars_rover = mars_rover(starting_at: starting_location)

      mars_rover.execute(%w{f f f})

      expected_coordinates = Coordinates.new(x: 2, y: 6)
      expect(mars_rover).to be_located_at(expected_coordinates).and be_facing('N')
    end

    context 'at the edge of the western hemisphere' do
      it 'moves into the eastern hemisphere' do
        starting_location = Location.new(direction: 'E', coordinates: Coordinates.new(x: 35, y: 0))
        mars_rover = mars_rover(starting_at: starting_location)

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 0, y: 0)).and be_facing('E')
      end
    end

    context 'at the edge of the eastern hemisphere' do
      it 'moves into the western hemisphere' do
        starting_location = Location.new(direction: 'W', coordinates: Coordinates.new(x: 0, y: 0))
        mars_rover = mars_rover(starting_at: starting_location)

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 35, y: 0)).and be_facing('W')
      end
    end

    describe 'encountering obstacles' do
      it 'moves to the last point before the obstacle and reports the coordinates of it' do
        map = Map.new
        obstacle_detector = ObstacleDetector.new([Coordinates.new(x: 1, y: 3)])
        starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 1, y: 2))
        mars_rover = mars_rover(on: map, obstacle_detector: obstacle_detector, starting_at: starting_location)

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 1, y: 2))
        expect(mars_rover.obstacle_encountered).to eq(Coordinates.new(x: 1, y: 3))
      end

      it 'moves to the last point before any obstacles' do
        map = Map.new
        obstacle_detector = ObstacleDetector.new([Coordinates.new(x: 5, y: 4)])
        starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 5, y: 3))
        mars_rover = mars_rover(on: map, obstacle_detector: obstacle_detector, starting_at: starting_location)

        mars_rover.execute(['f'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 5, y: 3))
        expect(mars_rover.obstacle_encountered).to eq(Coordinates.new(x: 5, y: 4))
      end

      it 'moves multiple times to the last point before any obstacles and then aborts the command' do
        map = Map.new
        obstacle_detector = ObstacleDetector.new([Coordinates.new(x: 4, y: 5)])
        starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 4, y: 0))
        mars_rover = mars_rover(on: map, obstacle_detector: obstacle_detector, starting_at: starting_location)

        mars_rover.execute(%w{f f f f f f f})

        expect(mars_rover).to be_located_at(Coordinates.new(x: 4, y: 4))
      end
    end
  end
end
