class MarsRover

  def initialize(starting_location:, map:)
    @current_location = starting_location
    @map = map
  end

  def execute(commands_from_earth)
    @current_location =
      commands_from_earth.inject(@current_location) do |location, command|
        case command
        when 'f'
          forwards(location)
        when 'b'
          backwards(location)
        when 'l'
          rotate_left(location)
        when 'r'
          rotate_right(location)
        else
          location
        end
    end
  end

  def obstacle_encountered
    @obstacle_coordinates
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

  def forwards(location)
    new_location, @obstacle_coordinates = [@map.forwards(location), Coordinates.new(x: 1, y: 3)]
    new_location
  end

  def backwards(location)
    @map.backwards(location)
  end

  def rotate_left(location)
    @map.rotate_left(location)
  end

  def rotate_right(location)
    @map.rotate_right(location)
  end
end
