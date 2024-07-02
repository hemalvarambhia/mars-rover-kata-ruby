require 'spec_helper'

describe 'Operating a Mars Rover' do
  CannotInitializeMarsRover = Class.new(StandardError)
  CannotCommandMarsRover = Class.new(StandardError)

  class MarsRover
    CARDINAL_DIRECTIONS = ['N', 'S', 'E', 'W']
    private_constant :CARDINAL_DIRECTIONS
    CARDINAL_COMMANDS = ['f', 'b', 'l', 'r']
    private_constant :CARDINAL_COMMANDS

    attr_reader :current_position, :direction

    def initialize(initial_position, direction: 'N')
      unless CARDINAL_DIRECTIONS.include?(direction)
        raise CannotInitializeMarsRover.new
      end
      @current_position = initial_position
      @direction = direction
    end

    def move_forward
      case @direction
      when 'N'
        @current_position = [@current_position[0], @current_position[1] + 1]
      when 'E'
        @current_position = [@current_position[0] + 1, @current_position[1]]
      when 'S'
        @current_position = [@current_position[0], @current_position[1] - 1]
      when 'W'
        @current_position = [@current_position[0] - 1, @current_position[1]]
      end
    end

    private :move_forward

    def self.valid_elements?(input_array, valid_array)
      input_array.all? { |element| valid_array.include?(element) }
    end

    def execute(commands)
      # Protect Mars Rover from obeying invalid commands. Input commands must
      # be in an array, and they must be one of the CARDINAL_COMMANDS.
      unless commands.is_a?(Array) &&
        MarsRover.valid_elements?(commands, CARDINAL_COMMANDS)
        raise CannotCommandMarsRover.new
      end

      command = commands[0]
      case command
      when 'f'
        move_forward
      when 'b'
        @current_position = [0, @current_position[1] - 1]
      end
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

  it 'moves forwards when facing north from y=2' do
    initial_position = [0, 2]
    mars_rover = MarsRover.new(initial_position, direction: 'N')
    expect { mars_rover.execute(['f']) }.to change(mars_rover, :current_position).from([0, 2]).to([0, 3])
  end

  it 'moves forwards when facing south from (-1, -1) to (-1, -2)' do
    initial_position = [-1, -1]
    mars_rover =  MarsRover.new(initial_position, direction: 'S')

    expect { mars_rover.execute(['f']) }.to change(mars_rover, :current_position).from([-1, -1]).to([-1, -2])
  end

  it 'does not change its position when there is an unsupported command' do
    initial_position = [3, -1]
    mars_rover =  MarsRover.new(initial_position, direction: 'N')
    # This tests both the exception raised and that the instance did not change.
    # TODO FIXME we need more validation tests.
    # For example, this tests a case where the input direction is the default,
    # and we need more than that.
    expect { mars_rover.execute(['q']) }.to raise_error(CannotCommandMarsRover)
    expect(mars_rover.current_position).to eq(initial_position)
    expect(mars_rover.direction).to eq('N')
  end

  it 'raises an error if the input is not an array' do
    initial_position = [3, -1]
    mars_rover =  MarsRover.new(initial_position, direction: 'N')
    # This tests both the exception raised and that the instance did not change.
    expect { mars_rover.execute('Hello World') }.to raise_error(CannotCommandMarsRover)
    expect(mars_rover.current_position).to eq(initial_position)
    expect(mars_rover.direction).to eq('N')
  end

  it 'raises an error if the input array is empty' do
    pending 'For Hemal'
    initial_position = [3, -1]
    mars_rover =  MarsRover.new(initial_position, direction: 'N')
    expect { mars_rover.execute([]) }.to raise_error(CannotCommandMarsRover)
  end

  it 'moves backwards when facing north' do
    initial_position = [0, 1]
    mars_rover = MarsRover.new(initial_position, direction: 'N')
    expect { mars_rover.execute(['b']) }.to change(mars_rover, :current_position).from([0, 1]).to([0, 0])
  end

  it 'moves backwards when facing east' do
    pending 'For Hemal'
    initial_position = [0, 1]
    mars_rover = MarsRover.new(initial_position, direction: 'E')
    expect { mars_rover.execute(['b']) }.to change(mars_rover, :current_position).from([0, 1]).to([-1, 1])
  end

  example 'moves forwards and then backwards'
end