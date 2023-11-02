class MarsRover

  def initialize(starting_location:)
    @current_location = starting_location
  end

  def execute(commands_from_earth)
    @current_location =
      commands_from_earth.inject(@current_location) do |location, command|
        case command
        when 'f'
          with_north_pole_correction(location.forwards)
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

  def with_north_pole_correction(location)
    if at_north_pole?(location.coordinates)
      Location.south_facing(Coordinates.new(x: location.coordinates.x + 18, y: location.coordinates.y))
    else
      location
    end
  end

  def at_north_pole?(coordinates)
    coordinates.y == 9
  end
end
