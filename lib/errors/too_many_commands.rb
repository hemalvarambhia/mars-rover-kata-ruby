# frozen_string_literal: true

class TooManyCommands < StandardError
  def initialize(message = 'Too many commands', commands: [])
    super(message)
    @commands = commands
  end

  def self.from_commands(commands)
    new(commands:)
  end

  def to_formatted_h
    {
      message:,
      commands: @commands
    }
  end
end
