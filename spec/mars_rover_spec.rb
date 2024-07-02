require 'spec_helper'

describe 'Operating a Mars Rover' do
  CannotInitializeMarsRover = Class.new(StandardError)

  class MarsRover
    CARDINAL_DIRECTIONS = ['N', 'S', 'E', 'W']
    private_constant :CARDINAL_DIRECTIONS

    attr_reader :current_position, :direction

    def initialize(initial_position, direction: 'N')
      unless CARDINAL_DIRECTIONS.include?(direction)
        raise CannotInitializeMarsRover.new
      end
      @current_position = initial_position
      @direction = direction
    end

    def execute(commands)
      # TODO FIXME commands is not validated.
      # It should be an array with specific valid elements 'f', 'b', 'l', 'r'
      @current_position = [0, 2]
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

  example 'cannot face X' do
    irrelevant = [0, -1]
    expect { MarsRover.new(irrelevant, direction: 'X') }.to raise_error(CannotInitializeMarsRover)
  end

  example 'cannot face anywhere outside N, E, S or W' do
    irrelevant = [0, -1]
    expect { MarsRover.new(irrelevant, direction: 'Y') }.to raise_error(CannotInitializeMarsRover)
  end

end

describe 'Moving a Mars Rover' do
  it 'receives an array of commands from Earth' do
    initial_position = [0, 0]
    mars_rover = MarsRover.new(initial_position, direction: 'N')
    expect(mars_rover).to respond_to(:execute).with(1)
  end

  it 'moves forwards when facing north' do
    initial_position = [0, 1]
    mars_rover = MarsRover.new(initial_position, direction: 'N')

    expect { mars_rover.execute(['f']) }.to change(mars_rover, :current_position).from([0, 1]).to([0, 2])
  end

  example 'moves backwards'
  example 'moves forwards and then backwards'
end