require 'spec_helper'

describe 'Operating a Mars Rover' do
  class MarsRover

    def initialize(initial_position)
      $logger.debug('initialize: initial_position \'' + initial_position&.to_s + '\'')
      @initial_position = initial_position
    end

    def current_position
      @initial_position
    end

    def direction

    end
  end

  before do
    # before each
  end

  after do
    # after each test
  end

  example 'has an initial position' do
    initial_position = [0, 0]
    mars_rover = MarsRover.new(initial_position)

    expect(mars_rover.current_position).to eq([0, 0])
  end

  example 'has an initial position anywhere on the planet' do
    initial_position = [1, 1]
    mars_rover = MarsRover.new(initial_position)

    expect(mars_rover.current_position).to eq([1, 1])
  end

  example 'has a direction it is facing' do
    pending 'Marya to get this test passing'
    irrelevant = [0, -1]
    mars_rover = MarsRover.new(irrelevant)

    expect(mars_rover.direction).to eq('N')
  end

end

describe 'Moving a Mars Rover' do
  example 'moves forward'
  example 'moves backwards'
  example 'moves forwards and then backwards'
end