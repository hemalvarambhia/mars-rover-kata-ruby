# frozen_string_literal: true

require_relative 'errors/cannot_command_mars_rover'
require_relative 'errors/cannot_initialize_mars_rover'
require_relative 'errors/too_many_commands'
require_relative 'position'
require_relative 'orientation'

# The MarsRover class represents a rover that can move on a 2D grid and rotate in cardinal directions.
#
# The rover keeps track of its position and orientation, and can execute movement commands.
# Valid commands are:
# - 'f': Move forward one space in the current direction
# - 'b': Move backward one space from the current direction
# - 'l': Rotate 90 degrees left/counterclockwise
# - 'r': Rotate 90 degrees right/clockwise
#
# @example Create and command a rover
#   rover = MarsRover.new([0,0], orientation: :north)
#   rover.execute(['f', 'r', 'f']) # Moves forward, turns right, moves forward
#
# @example Create with custom max commands
#   rover = MarsRover.new(maximum_number_of_commands: 20)
#
# @raise [CannotInitializeMarsRover] If the initial position or orientation is invalid
# @raise [CannotCommandMarsRover] If commands are empty or invalid
# @raise [TooManyCommands] If number of commands exceeds the maximum allowed
class MarsRover
  CARDINAL_COMMANDS = %w[f b l r].freeze
  private_constant :CARDINAL_COMMANDS

  attr_reader :position

  def initialize(initial_position = Position.origin, orientation: :north, maximum_number_of_commands: 10)
    @orientation = Orientation.from_symbol_or_string(orientation)
    @position = Position.from_array_or_position(initial_position)
    raise CannotInitializeMarsRover if @orientation.invalid?
    raise CannotInitializeMarsRover if @position.invalid?

    @maximum_number_of_commands = maximum_number_of_commands
  end

  def orientation
    @orientation.to_sym
  end

  def self.invalid_commands?(commands)
    !valid_commands?(commands)
  end

  def self.valid_commands?(commands)
    commands.is_a?(Array) &&
      commands.all? { |command| supported?(command) } &&
      !commands.empty?
  end

  def self.supported?(command)
    CARDINAL_COMMANDS.include?(command)
  end

  def execute(commands)
    raise CannotCommandMarsRover.from(commands:) if commands.empty?
    raise CannotCommandMarsRover.from(commands:) if MarsRover.invalid_commands?(commands)
    raise TooManyCommands.from(commands:) if commands.length > @maximum_number_of_commands

    commands.each do |command|
      case command
      when 'f'
        move_forward
      when 'b'
        move_backward
      when 'l'
        turn_left
      when 'r'
        turn_right
      end
    end
  end

  def move_forward
    @position = @position.move(@orientation)
  end

  def move_backward
    @position = @position.move(@orientation.opposite)
  end

  def turn_left
    @orientation = @orientation.rotate_left
  end

  def turn_right
    @orientation = @orientation.rotate_right
  end

  def inspect
    "A Mars rover currently positioned at #{@position} facing #{@orientation.to_sym}"
  end

  # I like this. I didn't know I could that. Normally, rubyists put the private section
  # at the bottom of the class.
  private :move_forward
end
