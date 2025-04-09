require_relative 'errors/cannot_command_mars_rover'
require_relative 'errors/cannot_initialize_mars_rover'
require_relative 'cardinal_directions'

Position = Data.define(:x, :y) do
  def self.origin
    new(x: 0, y: 0)
  end

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

  def translate(orientation)
    case orientation
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

  def to_s
    "(#{x}, #{y})"
  end
end

class MarsRover
  include CardinalDirections
  CARDINAL_COMMANDS = %w[f b l r]
  private_constant :CARDINAL_COMMANDS

  attr_reader :direction, :position

  def initialize(initial_position = Position.origin, direction: :north, orientation: direction)
    raise CannotInitializeMarsRover.new unless CardinalDirections::ALL_DIRECTIONS.include?(direction)

    @position = Position.new(x: initial_position[0], y: initial_position[1])
    @direction = direction
    @orientation = orientation
  end

  def move_forward
    @position = @position.translate(@orientation)
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
      case @orientation
      when :north
        @position = @position.translate(:south)
      when :east
        @position = @position.translate(:west)
      when :south
        @position = @position.translate(:north)
      when :west
        @position = @position.translate(:east)
      end
    end
  end

  def inspect
    "A Mars rover currently positioned at #{@position} facing #{@orientation}"
  end

  # I like this. I didn't know I could that. Normally, rubyists put the private section
  # at the bottom of the class.
  private :move_forward
end
