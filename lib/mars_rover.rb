require 'forwardable'
require_relative './translation'
require_relative './location'
class MarsRover
  extend Forwardable

  def_delegator :@current_location, :direction

  def initialize(starting_coordinates:, direction:)
    @direction = direction
    @current_location = Location.new(coordinates: starting_coordinates, direction: direction)
  end


  def execute(command)
    translation = to_movements(command).reduce(:+)
    @current_location = @current_location.translate(translation)
  end

  def position
    @current_location
  end

  private

  def to_movements(command)
    if command.empty?
      [ Translation.no_where ]
    else
      command.split('').map { |instruction| movement_for(instruction) }
    end
  end

  def movement_for(instruction)
    {
      'f' => Translation.forward(direction),
      'b' => Translation.backward(direction)
    }[instruction] || Translation.no_where
  end
end
