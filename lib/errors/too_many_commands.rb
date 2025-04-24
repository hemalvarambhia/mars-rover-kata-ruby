# frozen_string_literal: true

class TooManyCommands < StandardError
  def initialize(message = 'Too many commands', commands: [])
    super(message)
    @commands = commands
  end

  def to_formatted_h
    {
      message:,
      commands: []
    }
  end
end
