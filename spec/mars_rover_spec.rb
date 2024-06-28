require 'spec_helper'

describe 'Operating a Mars Rover' do
  class CannotInitializeMarsRover
  end

  class MarsRover
    attr_reader :current_position, :direction

    def initialize(initial_position, direction:)
      @current_position = initial_position
      @direction = direction
    end

    def inspect
      "A Mars rover currently positioned at #{@current_position} facing #{@direction}"
    end
  end

  example 'has an initial position' do
    initial_position = [0, 0]
    mars_rover = MarsRover.new(initial_position, direction: 'N')

    expect(mars_rover.current_position).to eq([0, 0])
  end

  example 'has an initial position anywhere on the planet' do
    initial_position = [1, 1]
    mars_rover = MarsRover.new(initial_position, direction: 'N')

    expect(mars_rover.current_position).to eq([1, 1])
  end

  example 'has a direction it is facing' do
    irrelevant = [0, -1]
    mars_rover = MarsRover.new(irrelevant, direction: 'N')

    expect(mars_rover.direction).to eq('N')
  end

  example 'has an initial direction it is facing' do
    irrelevant = [0, -1]
    mars_rover = MarsRover.new(irrelevant, direction: 'E')

    expect(mars_rover.direction).to eq('E')
  end

  example 'cannot face anywhere outside N, E, S or W' do
    pending 'Marya to get test passing'
    irrelevant = [0, -1]
    expect { MarsRover.new(irrelevant, direction: 'X') }.to raise_error(CannotInitializeMarsRover)
  end

end

describe 'Moving a Mars Rover' do
  example 'moves forward'
  example 'moves backwards'
  example 'moves forwards and then backwards'
end