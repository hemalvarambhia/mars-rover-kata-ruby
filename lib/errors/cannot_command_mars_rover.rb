# frozen_string_literal: true

# Error raised when trying to command a Mars Rover with invalid commands
#
# @example Raise error with default message
#   raise CannotCommandMarsRover.new
#
# @example Raise error with commands
#   commands = ['f']
#   raise CannotCommandMarsRover.new(commands: commands)
#
# @example Create error from commands
#   commands = ['f']
#   CannotCommandMarsRover.from(commands: commands)
class CannotCommandMarsRover < StandardError
  def initialize(message = 'Cannot command Mars Rover', commands: [])
    super(message)
    @commands = commands
  end

  def self.from(commands:)
    new(commands:)
  end

  # Returns a hash representation of the error
  #
  # @return [Hash] Hash containing error message and commands
  def to_formatted_h
    {
      message:,
      commands: @commands
    }
  end
end
