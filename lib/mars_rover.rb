require 'coordinates'
require 'location'
class MarsRover
  attr_reader :direction, :current_position

  def initialize(direction:, starting_position:, starting_location: Location.new(coordinates: starting_position, direction: direction))
    @direction = direction
    @current_location = starting_location
  end

  def execute(commands_from_earth)
    commands_from_earth.each do |command|
      case command
      when 'f'
        @current_location = @current_location.forwards
      when 'b'
        @current_location = @current_location.backwards
      when 'l'
        @current_location = @current_location.rotate_left
        @direction = @current_location.direction
      when 'r'
        @current_location = @current_location.rotate_right
        @direction = @current_location.direction
      end
    end
  end

  def current_position
    @current_location.coordinates
  end

  def inspect
    "a Mars Rover at #{@current_location.coordinates.inspect} facing #{@current_location.direction}"
  end

  def to_s
    "a Mars Rover facing #{@current_location.direction} starting from #{@current_location.coordinates}"
  end
end
