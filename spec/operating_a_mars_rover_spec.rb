require_relative '../lib/coordinates'
require_relative '../lib/location'
require 'mars_rover_set_up'
require_relative './mars_rover_matchers'
RSpec.describe 'Operating a Mars rover' do
  include MarsRoverMatchers, MarsRoverSetUp

  it 'has a starting position at the origin' do
    starting_location = Location.new(direction: 'N', coordinates: Coordinates.new(x: 0, y: 0))
    mars_rover = mars_rover(starting_at: starting_location)

    expected_coordinate = Coordinates.new(x: 0, y: 0)
    expect(mars_rover).to be_located_at(expected_coordinate)
  end

  it 'has a starting position anywhere on the planet' do
    starting_location = Location.new(direction: 'S', coordinates: Coordinates.new(x: 2, y: 3))
    mars_rover = mars_rover(starting_at: starting_location)

    expected_coordinates = Coordinates.new(x: 2, y: 3)
    expect(mars_rover).to be_located_at(expected_coordinates)
  end

  %w{N E S W}.each do |direction|
    it "can face any direction, including #{direction}" do
      anywhere_facing_direction = Location.new(direction: direction, coordinates: Coordinates.new(x: 2, y: -3))
      mars_rover = mars_rover(starting_at: anywhere_facing_direction)

      expect(mars_rover).to be_facing(direction)
    end
  end

  it 'cannot be operated when it is facing any direction outside of N, E, S or W' do
    pending('Discussion with customer')
    any_location = Location.new(coordinates: Coordinates.new(x: -2, y: -3), direction: 'Not N, E, S, W')
    expect { mars_rover(starting_at: any_location) }.to raise_error('A Mars rover has to be facing N, E, S or W')
  end

  it 'cannot be operated when a starting position is not provided' do
    pending('Discussion with customer')
    expect { mars_rover(starting_at: nil) }.to raise_error('A Mars rover must be given a location to start from')
  end
end