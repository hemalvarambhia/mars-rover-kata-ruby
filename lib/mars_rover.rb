require_relative 'errors/cannot_command_mars_rover'
require_relative 'errors/cannot_initialize_mars_rover'
require_relative 'cardinal_directions'

class MarsRover
  include CardinalDirections
  CARDINAL_COMMANDS = ['f', 'b', 'l', 'r']
  private_constant :CARDINAL_COMMANDS

  attr_reader :current_position, :direction

  def initialize(initial_position, direction: :north)
    unless CardinalDirections::ALL_DIRECTIONS.include?(direction)
      raise CannotInitializeMarsRover.new
    end

    @current_position = initial_position
    @direction = direction
  end

  def move_forward
    case @direction
    when :north
      @current_position = [@current_position[0], @current_position[1] + 1]
    when :east
      @current_position = [@current_position[0] + 1, @current_position[1]]
    when :south
      @current_position = [@current_position[0], @current_position[1] - 1]
    when :west
      @current_position = [@current_position[0] - 1, @current_position[1]]
    end
  end

  def self.valid_commands?(commands)
    commands.is_a?(Array) &&
      commands.all? { |command| supported?(command) } &&
      ! commands.empty?
  end

  def self.supported?(command)
    CARDINAL_COMMANDS.include?(command)
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
      case @direction
      when :north
        @current_position = [0, @current_position[1] - 1]
      when :east
        @current_position = [-1, 1]
      end
    end
  end

  def inspect
    "A Mars rover currently positioned at #{@current_position} facing #{@direction}"
  end

  # I like this. I didn't know I could that. Normally, rubyists put the private section
  # at the bottom of the class.
  private :move_forward

end