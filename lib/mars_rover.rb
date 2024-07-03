require_relative 'errors/cannot_command_mars_rover'
require_relative 'errors/cannot_initialize_mars_rover'

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

  def self.valid_commands?(commands)
    commands.is_a?(Array) &&
      commands.all? { |command| CARDINAL_COMMANDS.include?(command) } &&
      ! commands.empty?
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
      @current_position = [0, @current_position[1] - 1]
    end
  end

  def inspect
    "A Mars rover currently positioned at #{@current_position} facing #{@direction}"
  end
end