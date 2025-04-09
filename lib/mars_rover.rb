require_relative 'errors/cannot_command_mars_rover'
require_relative 'errors/cannot_initialize_mars_rover'
require_relative 'cardinal_directions'

Position = Data.define(:x, :y) do
  def to_a
    [x, y]
  end

  def [](index)
    if index == 0
      x
    elsif index == 1
      y
    else
      raise RuntimeError("No such index as #{index}")
    end
  end

  def translate(direction)
    case direction
    when :north
      with(y: y + 1)
    when :east
      with(x: x + 1)
    when :south
      with(y: y - 1)
    when :west
      with(x: x - 1)
    end
  end
end

class MarsRover
  include CardinalDirections
  CARDINAL_COMMANDS = %w[f b l r]
  private_constant :CARDINAL_COMMANDS

  attr_reader :direction, :current_coordinates

  def initialize(initial_position, direction: :north)
    raise CannotInitializeMarsRover.new unless CardinalDirections::ALL_DIRECTIONS.include?(direction)

    @current_position = initial_position.to_a
    @current_coordinates = Position.new(x: initial_position[0], y: initial_position[1])
    @direction = direction
  end

  def position
    @current_coordinates
  end

  def move_forward
    case @direction
    when :north
      @current_coordinates = @current_coordinates.with(y: @current_coordinates.y + 1)
    when :east
      @current_coordinates = @current_coordinates.with(x: @current_coordinates.x + 1)
    when :south
      @current_coordinates = @current_coordinates.with(y: @current_coordinates.y - 1)
    when :west
      @current_coordinates = @current_coordinates.with(x: @current_coordinates.x - 1)
    end
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
    # Protect Mars Rover from obeying invalid commands. Input commands must
    # be in an array, and they must be one of the CARDINAL_COMMANDS.
    raise CannotCommandMarsRover.new unless MarsRover.valid_commands?(commands)

    command = commands[0]
    case command
    when 'f'
      move_forward
    when 'b'
      case @direction
      when :north
        @current_position = [0, @current_position[1] - 1]
        @current_coordinates = Position.new(x: @current_position[0], y: @current_position[1])
      when :east
        @current_position = [-1, 1]
        @current_coordinates = Position.new(x: @current_position[0], y: @current_position[1])
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
