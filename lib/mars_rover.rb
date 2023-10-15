require 'coordinates'
class MarsRover
  attr_reader :direction

  def initialize(x: 0, y: 0, direction:, starting_position:)
    @current_position = starting_position
    @direction = direction
  end

  def x
    @current_position.x
  end

  def y
    @current_position.y
  end
end
