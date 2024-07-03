require 'spec_helper'

describe 'Initializing a Mars Rover' do

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

  example 'cannot face X' do
    irrelevant = [0, -1]
    expect { MarsRover.new(irrelevant, direction: 'X') }.to raise_error(CannotInitializeMarsRover)
  end

  example 'cannot face anywhere outside N, E, S or W' do
    irrelevant = [0, -1]
    expect { MarsRover.new(irrelevant, direction: 'Y') }.to raise_error(CannotInitializeMarsRover)
  end

end
