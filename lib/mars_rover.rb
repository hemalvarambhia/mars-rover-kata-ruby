require_relative 'errors/cannot_command_mars_rover'
require_relative 'errors/cannot_initialize_mars_rover'
require 'cardinal_directions'
require 'displacement'
require 'point'

class MarsRover
  include CardinalDirections

  attr_reader :direction, :current_coordinates

  def initialize(initial_position, starting_point: Point.new(x: initial_position[0], y: initial_position[1]), direction: :north)
    raise CannotInitializeMarsRover.new unless supported?(direction)

    @current_coordinates = starting_point
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
    raise CannotCommandMarsRover.new unless MarsRover.valid_commands?(commands)

    commands.each(&method(:run))
  end

  def inspect
    "A Mars rover currently positioned at #{@current_coordinates} facing #{@direction}"
  end

  private

  def run(command)
    case command
    when 'f'
      move_forward
    when 'b'
      move_backwards
    end
  end

  def move_forward
    @current_coordinates += forwards(@direction)
  end

  def move_backwards
    @current_coordinates += backwards(@direction)
  end

  CARDINAL_COMMANDS = %w[f b l r].freeze
  private_constant :CARDINAL_COMMANDS

  def self.valid_commands?(commands)
    commands.is_a?(Array) &&
      commands.all? { |command| supported?(command) } && !commands.empty?
  end

  def self.supported?(command)
    CARDINAL_COMMANDS.include?(command)
  end
end