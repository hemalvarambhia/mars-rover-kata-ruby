require_relative '../lib/coordinates'
require_relative '../lib/location'
require 'mars_rover_set_up'
require_relative './mars_rover_matchers'
describe 'Moving a Mars rover' do
  include MarsRoverMatchers, MarsRoverSetUp
  extend MarsRoverSetUp

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

    describe 'encountering obstacles' do
      it 'moves to the last point before the obstacle and reports the coordinates of it' do
        obstacle_detector = ObstacleDetector.new([Coordinates.new(x: 1, y: 2)])
        starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 1, y: 3))
        mars_rover = mars_rover(starting_at: starting_location, obstacle_detector: obstacle_detector)

        mars_rover.execute(['b'])

        expect(mars_rover).to be_located_at(Coordinates.new(x: 1, y: 3))
      end

      it 'moves multiple steps up to the last point before the obstacle'
    end
  end
end
