require 'spec_helper'

describe 'Operating a Mars Rover' do
  class MarsRover
    attr_reader :direction

    def initialize(initial_position, direction: 'N')
      @initial_position = initial_position
      @direction = direction
    end

    def current_position
      @initial_position
    end

    def inspect
      "initialize: initial_position = #{@initial_position}"
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
    irrelevant = [0, -1]
    mars_rover = MarsRover.new(irrelevant)

    expect(mars_rover.direction).to eq('N')
  end

  example 'has an initial direction it is facing' do
    irrelevant = [0, -1]
    mars_rover = MarsRover.new(irrelevant, direction: 'E')

    expect(mars_rover.direction).to eq('E')
  end

end

describe 'Moving a Mars Rover' do
  example 'moves forward'
  example 'moves backwards'
  example 'moves forwards and then backwards'
end