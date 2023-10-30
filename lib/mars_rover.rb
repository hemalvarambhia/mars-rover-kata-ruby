require 'location'
class MarsRover

  def initialize(starting_location:)
    @current_location = starting_location
  end

  def execute(commands_from_earth)
    @current_location =
      commands_from_earth.inject(@current_location) do |location, command|
        case command
        when 'f'
          corrected_for_north_pole(location.forwards)
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
    "a Mars Rover at #{@current_location.inspect}"
  end

  def to_s
    "a Mars Rover #{@current_location}"
  end

  private

  def corrected_for_north_pole(location)
    if at_north_pole?(location.coordinates)
      Location.new(coordinates: Coordinates.new(x: 18, y: location.coordinates.y), direction: 'S').forwards
    else
      location
    end
  end

  def at_north_pole?(coordinates)
    north_pole = Coordinates.new(x: 0, y: 9)
    coordinates == north_pole
  end
end
