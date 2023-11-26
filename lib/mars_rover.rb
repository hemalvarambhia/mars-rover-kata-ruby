class MarsRover

  def initialize(starting_location:)
    @current_location = starting_location
  end

  def execute(commands_from_earth)
    @current_location =
      commands_from_earth.inject(@current_location) do |location, command|
        case command
        when 'f'
          forwards_correction_at_north_pole(location.forwards)
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

  def forwards_correction_at_north_pole(location)
    if located_at_north_pole?(location)
      Location.south_facing(Coordinates.new(x: (location.x + 18) % 36, y: location.y - 1))
    else
      location
    end
  end

  NORTH_POLE_LATITUDE = 9
  private_constant :NORTH_POLE_LATITUDE

  def located_at_north_pole?(location)
    location.y == NORTH_POLE_LATITUDE
  end
end
