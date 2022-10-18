require_relative './translation'
require_relative './location'
class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
    @current_location = Location.new(coordinates: starting_coordinates, direction: direction)
  end


  def execute(command)
    translation = to_movements(command).reduce(:+)
    @current_coordinates = @current_coordinates.translate(translation)
    @current_location = Location.new(coordinates: @current_coordinates, direction: direction)
  end

  def position
    Location.new(
      coordinates: coordinates,
      direction: direction
    )
    @current_location
  end

  private

  def coordinates
    @current_coordinates
    @current_location.coordinates
  end

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
