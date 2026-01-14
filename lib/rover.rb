# frozen_string_literal: true

# Mars Rover - remotely controlled vehicle for Mars exploration

class Rover
  attr_reader :direction

  def initialize(coordinates:, direction:)
    raise ArgumentError, 'Coordinates cannot be nil' if coordinates.nil?

    validate_direction!(direction)
    @coordinates = coordinates
    @direction = direction
  end

  def x
    @coordinates.x
  end

  def y
    @coordinates.y
  end

  def execute_commands(commands)
    raise ArgumentError, 'Commands must be an array' unless commands.is_a?(Array)

    validate_commands!(commands)
    commands.each do |command|
      case command
      when 'f' then move_forward
      when 'b' then move_backward
      end
    end
  end

  private

  def validate_commands!(commands)
    valid = %w[f b l r]
    commands.each do |command|
      next if valid.include?(command)

      raise ArgumentError,
            "Invalid command '#{command}'. Valid commands: f (forward), b (backward), l (left), r (right)"
    end
  end

  def move_forward
    case @direction
    when :north then @coordinates = Coordinates.new(@coordinates.x, @coordinates.y + 1)
    when :south then @coordinates = Coordinates.new(@coordinates.x, @coordinates.y - 1)
    when :east then @coordinates = Coordinates.new(@coordinates.x + 1, @coordinates.y)
    when :west then @coordinates = Coordinates.new(@coordinates.x - 1, @coordinates.y)
    end
  end

  def move_backward
    case @direction
    when :north then @coordinates = Coordinates.new(@coordinates.x, @coordinates.y - 1)
    when :south then @coordinates = Coordinates.new(@coordinates.x, @coordinates.y + 1)
    when :east then @coordinates = Coordinates.new(@coordinates.x - 1, @coordinates.y)
    when :west then @coordinates = Coordinates.new(@coordinates.x + 1, @coordinates.y)
    end
  end

  def validate_direction!(direction)
    valid_directions = %i[north south east west]
    return if valid_directions.include?(direction)

    raise ArgumentError, "Invalid direction: #{direction}"
  end
end
