# frozen_string_literal: true

# Error raised when too many commands are sent to a Mars Rover
#
# @example Raise error with default message
#   raise TooManyCommands.new
#
# @example Raise error with commands
#   commands = ['f'] * 11
#   raise TooManyCommands.new(commands: commands)
#
# @example Create error from commands
#   commands = ['f'] * 11
#   TooManyCommands.from(commands: commands)
class TooManyCommands < StandardError
  def initialize(message = 'Too many commands', commands: [])
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
