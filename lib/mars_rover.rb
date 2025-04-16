require_relative 'errors/cannot_command_mars_rover'
require_relative 'errors/cannot_initialize_mars_rover'
require_relative 'position'
class Orientation
  # Returns array of valid cardinal directions that a Mars Rover can face
  # @return [Array<Symbol>] Array containing :north, :east, :south, :west
  def self.all
    %i[north east south west]
  end

  # Checks if an orientation is valid
  # @param orientation [Symbol] The orientation to validate
  # @return [Boolean] true if orientation is one of :north, :east, :south, :west
  def self.valid?(orientation)
    all.include?(orientation)
  end

  # Checks if an orientation is invalid
  # @param orientation [Symbol] The orientation to validate
  # @return [Boolean] true if orientation is not one of :north, :east, :south, :west
  def self.invalid?(orientation)
    !valid?(orientation)
  end
end

class MarsRover
  CARDINAL_COMMANDS = %w[f b l r]
  private_constant :CARDINAL_COMMANDS

  attr_reader :position, :orientation

  def initialize(initial_position = Position.origin, orientation: :north)
    raise CannotInitializeMarsRover.new if Orientation.invalid?(orientation)

    @position = Position.new(x: initial_position[0], y: initial_position[1])
    @orientation = orientation
  end

  def move_forward
    @position = @position.move(orientation)
  end

  def move_backward
    @position = @position.move(opposite_orientation(orientation))
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
    }.fetch(orientation)
  end

  def execute(commands)
    raise CannotCommandMarsRover.new if commands.empty?
    raise CannotCommandMarsRover.new if MarsRover.invalid_commands?(commands)

    command = commands[0]
    case command
    when 'f'
      move_forward
    when 'b'
      move_backward
    when 'l'
      case @orientation
      when :north
        @orientation = :west
      when :west
        @orientation = :south
      when :south
        @orientation = :east
      when :east
        @orientation = :north
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
