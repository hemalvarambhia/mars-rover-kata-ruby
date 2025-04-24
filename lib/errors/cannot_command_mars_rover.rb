# frozen_string_literal: true

class CannotCommandMarsRover < StandardError
  def initialize(message = 'Cannot command Mars Rover', commands: [])
    super(message)
  end
end
