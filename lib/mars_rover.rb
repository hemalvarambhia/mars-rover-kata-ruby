class MarsRover

  NORTH_POLE_LATITUDE = 9
  private_constant :NORTH_POLE_LATITUDE

  SOUTH_POLE_LATITUDE = -9
  private_constant :SOUTH_POLE_LATITUDE

  def initialize(starting_location:)
    @current_location = starting_location
  end

  def execute(commands_from_earth)
    @current_location =
      commands_from_earth.inject(@current_location) do |location, command|
        case command
        when 'f'
          move_forwards(location)
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

  def move_forwards(location)
    new_location = with_north_pole_correction(location.forwards)
    with_south_pole_correction(new_location)
  end

  def with_south_pole_correction(location)
    at_south_pole = location.coordinates.y == SOUTH_POLE_LATITUDE
    if at_south_pole
      Location.north_facing(Coordinates.new(x: (location.coordinates.x + 18) % 36, y: -8))
    else
      location
    end
  end

  def with_north_pole_correction(location)
    at_north_pole = (location.coordinates.y == NORTH_POLE_LATITUDE)
    if at_north_pole
      Location.south_facing(Coordinates.new(x: (location.coordinates.x + 18) % 36, y: location.coordinates.y - 1))
    else
      location
    end
  end
end
