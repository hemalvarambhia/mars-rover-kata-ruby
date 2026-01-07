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

  def receive_commands(commands)
    raise ArgumentError, 'Commands must be an array' unless commands.is_a?(Array)

    valid_commands = %w[f b l r]
    commands.each do |cmd|
      raise ArgumentError, "Unsupported command: #{cmd}" unless valid_commands.include?(cmd)
    end
  end

  private

  def validate_direction!(direction)
    valid_directions = %i[north south east west]
    return if valid_directions.include?(direction)

    raise ArgumentError, "Invalid direction: #{direction}"
  end
end
