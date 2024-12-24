require_relative 'errors/cannot_command_mars_rover'
require_relative 'errors/cannot_initialize_mars_rover'
require 'cardinal_directions'
require 'displacement'
require 'point'

class MarsRover
  include CardinalDirections

  attr_reader :direction, :current_coordinates

  def initialize(initial_position, direction: :north)
    unless CardinalDirections::ALL_DIRECTIONS.include?(direction)
      raise CannotInitializeMarsRover.new
    end

    @current_coordinates = Point.new(x: initial_position[0], y: initial_position[1])
    @direction = direction
  end

  def x_coordinate
    @current_coordinates.x
  end

  def y_coordinate
    @current_coordinates.y
  end

  def execute(commands)
    # Protect Mars Rover from obeying invalid commands. Input commands must
    # be in an array, and they must be one of the CARDINAL_COMMANDS.
    unless MarsRover.valid_commands?(commands)
      raise CannotCommandMarsRover.new
    end

    command = commands[0]
    case command
    when 'f'
      move_forward
    when 'b'
      move_backwards
    end
  end

  def inspect
    "A Mars rover currently positioned at #{@current_coordinates} facing #{@direction}"
  end

  private

  def move_forward
    displacements = {
      north: Displacement.new(dx: 0, dy: 1),
      east: Displacement.new(dx: 1, dy: 0),
      south: Displacement.new(dx: 0, dy: -1),
      west: Displacement.new(dx: -1, dy: 0)
    }

    @current_coordinates += displacements[@direction]
  end

  def move_backwards
    case @direction
    when :north
      displacement = Displacement.new(dx: 0, dy: -1)
    when :east
      displacement = Displacement.new(dx: -1, dy: 0)
    when :south
      displacement = Displacement.new(dx: 0, dy: 1)
    when :west
      displacement = Displacement.new(dx: 1, dy: 0)
    end
    @current_coordinates += displacement
  end

  CARDINAL_COMMANDS = ['f', 'b', 'l', 'r']
  private_constant :CARDINAL_COMMANDS

  def self.valid_commands?(commands)
    commands.is_a?(Array) &&
      commands.all? { |command| supported?(command) } &&
      ! commands.empty?
  end

  def self.supported?(command)
    CARDINAL_COMMANDS.include?(command)
  end
end