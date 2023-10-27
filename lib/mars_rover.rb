require 'location'
class MarsRover

  def initialize(direction:, starting_position:, starting_location: Location.new(coordinates: starting_position, direction: direction))
    @current_location = starting_location
  end

  def execute(commands_from_earth)
    @current_location = commands_from_earth.inject(@current_location) do |location, command|
      case command
      when 'f'
        location.forwards
      when 'b'
        location.backwards
      when 'l'
        location.rotate_left
      when 'r'
        location.rotate_right
      else
        location
      end
    end
  end

  def current_position
    @current_location.coordinates
  end

  def direction
    @current_location.direction
  end

  def inspect
    "a Mars Rover at #{@current_location.coordinates.inspect} facing #{@current_location.direction}"
  end

  def to_s
    "a Mars Rover facing #{@current_location.direction} starting from #{@current_location.coordinates}"
  end
end
