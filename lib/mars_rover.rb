require 'north_pole'
require 'south_pole'
class MarsRover

  def initialize(starting_location:)
    @current_location = starting_location
  end

  def execute(commands_from_earth)
    @current_location =
      commands_from_earth.inject(@current_location) do |location, command|
        case command
        when 'f'
          forwards_correction_at_south_pole forwards_correction_at_north_pole(location)
        when 'b'
          move_backwards(location)
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

  def forwards_correction_at_north_pole(location)
    if located_at_north_pole?(location.forwards)
      NorthPole.new.forwards(location)
    else
      location.forwards
    end
  end

  def move_backwards(location)
    if located_at_north_pole?(location.backwards)
      NorthPole.new.backwards(location)
    else
      location.backwards
    end
  end

  def forwards_correction_at_south_pole(location)
    if located_at_south_pole?(location)
      SouthPole.new.forwards(location)
    else
      location
    end
  end

  def located_at_south_pole?(location)
    south_pole_latitude = -9
    location.y == south_pole_latitude
  end

  def located_at_north_pole?(location)
    north_pole_latitude = 9
    location.y == north_pole_latitude
  end
end
