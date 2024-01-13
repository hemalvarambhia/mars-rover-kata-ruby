require 'map'
class MarsRover

  def initialize(starting_location:, map: Map.new)
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
          move_backwards(location)
        when 'l'
          rotate_left(location)
        when 'r'
          rotate_right(location)
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

  def forwards(location)
    @map.map_for(location.forwards).forwards(location)
  end

  def move_backwards(location)
    @map.map_for(location.backwards).backwards(location)
  end

  def rotate_left(location)
    @map.map_for(location).rotate_left(location)
  end

  def rotate_right(location)
    @map.map_for(location).rotate_right(location)
  end
end
