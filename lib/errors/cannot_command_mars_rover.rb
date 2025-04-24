# frozen_string_literal: true

class CannotCommandMarsRover < StandardError
  def initialize(message = 'Cannot command Mars Rover')
    super(message)
  end
end
