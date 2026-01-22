# frozen_string_literal: true

require_relative 'direction'

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
    raise ArgumentError, 'Commands must be an array' unless commands.is_a?(Array)

    valid = %w[f b l r]
    commands.each do |command|
      next if valid.include?(command)

      raise ArgumentError,
            "Invalid command '#{command}'. Valid commands: f (forward), b (backward), l (left), r (right)"
    end
  end

  def move_forward
    delta_x, delta_y = Direction.delta_for(@direction)
    @coordinates = @coordinates.translate(delta_x, delta_y)
  end

  def move_backward
    delta_x, delta_y = Direction.delta_for(@direction)
    @coordinates = @coordinates.translate(-delta_x, -delta_y)
  end

  def validate_direction!(direction)
    return if Direction.valid?(direction)

    raise ArgumentError, "Invalid direction: #{direction}"
  end
end
