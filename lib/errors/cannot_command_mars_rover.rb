# frozen_string_literal: true

class CannotCommandMarsRover < StandardError
  def initialize(message = 'Cannot command Mars Rover', commands: [])
    super(message)
    @commands = commands
  end

  def to_formatted_h
    {
      message:,
      commands: @commands
    }
  end
end
