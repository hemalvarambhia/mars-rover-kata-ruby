# frozen_string_literal: true

require_relative 'errors/cannot_command_mars_rover'
require_relative 'errors/cannot_initialize_mars_rover'
require_relative 'errors/too_many_commands'
require_relative 'position'
require_relative 'orientation'

class MarsRover
  CARDINAL_COMMANDS = %w[f b l r]
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

  def move_forward
    @position = @position.move(@orientation)
  end

  def move_backward
    @position = @position.move(opposite_orientation(@orientation))
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

  def opposite_orientation(orientation)
    {
      north: :south,
      east: :west,
      south: :north,
      west: :east
    }.fetch(orientation.to_sym)
  end

  def execute(commands)
    raise CannotCommandMarsRover if commands.empty?
    raise CannotCommandMarsRover if MarsRover.invalid_commands?(commands)
    raise TooManyCommands if commands.length > @maximum_number_of_commands

    command = commands[0]
    case command
    when 'f'
      move_forward
    when 'b'
      move_backward
    when 'l'
      turn_left
    end
  end

  def turn_left
    case @orientation.to_sym
    when :north
      @orientation = Orientation.new(:west)
    when :west
      @orientation = Orientation.new(:south)
    when :south
      @orientation = Orientation.new(:east)
    when :east
      @orientation = Orientation.new(:north)
    end
  end

  def inspect
    "A Mars rover currently positioned at #{@position} facing #{@orientation.to_sym}"
  end

  # I like this. I didn't know I could that. Normally, rubyists put the private section
  # at the bottom of the class.
  private :move_forward
end
