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
          new_location = location.forwards
          if at_north_pole?(new_location)
            Location.new(coordinates: Coordinates.new(x: 18, y: 9), direction: 'S').forwards
          else
            new_location
          end
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

  def at_north_pole?(location)
    north_pole = Coordinates.new(x: 0, y: 9)
    location.coordinates == north_pole
  end
end
