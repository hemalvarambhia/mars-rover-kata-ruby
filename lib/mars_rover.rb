class MarsRover

  NORTH_POLE_LATITUDE = 9
  private_constant :NORTH_POLE_LATITUDE

  def initialize(starting_location:)
    @current_location = starting_location
  end

  def execute(commands_from_earth)
    @current_location =
      commands_from_earth.inject(@current_location) do |location, command|
        case command
        when 'f'
          new_location = with_north_pole_correction(location.forwards)
          with_south_pole_correction(new_location)
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

  def with_south_pole_correction(location)
    if at_south_pole?(location.coordinates)
      Location.new(direction: 'N', coordinates: Coordinates.new(x: 18, y: -8))
    else
      location
    end
  end

  def with_north_pole_correction(location)
    if at_north_pole?(location.coordinates)
      Location.south_facing(Coordinates.new(x: (location.coordinates.x + 18) % 36, y: location.coordinates.y - 1))
    else
      location
    end
  end

  def at_north_pole?(coordinates)
    coordinates.y == NORTH_POLE_LATITUDE
  end

  def at_south_pole?(coordinates)
    coordinates.y == -9
  end
end
