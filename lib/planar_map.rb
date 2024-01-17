require 'coordinates'
require 'location'
class NonPolarMap
  def initialize(obstacles: [Coordinates.new(x: 1, y: 3)])
    @obstacles = obstacles
  end

  def forwards(location)
    case location.direction
    when 'N'
      next_location = Location.new(coordinates: Coordinates.new(x: location.x, y: location.y + 1), direction: location.direction)
      if obstacle_encountered_at?(next_location)
        location
      else
        next_location
      end
    when 'E'
      Location.new(coordinates: Coordinates.new(x: (location.x + 1) % 36, y: location.y), direction: location.direction)
    when 'S'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y - 1), direction: location.direction)
    when 'W'
      Location.new(coordinates: Coordinates.new(x: (location.x - 1) % 36, y: location.y), direction: location.direction)
    end
  end

  def backwards(location)
    case location.direction
    when 'N'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y - 1), direction: location.direction)
    when 'E'
      Location.new(coordinates: Coordinates.new(x: (location.x - 1) % 36, y: location.y), direction: location.direction)
    when 'S'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y + 1), direction: location.direction)
    when 'W'
      Location.new(coordinates: Coordinates.new(x: (location.x + 1) % 36, y: location.y), direction: location.direction)
    end
  end


  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  def rotate_left(location)
    Location.new(
      coordinates: location.coordinates,
      direction: TURN_LEFT[location.direction]
    )
  end

  TURN_RIGHT = TURN_LEFT.invert
  private_constant :TURN_RIGHT

  def rotate_right(location)
    Location.new(
      coordinates: location.coordinates,
      direction: TURN_RIGHT[location.direction]
    )
  end

  private

  def obstacle_encountered_at?(location)
    @obstacles.include?(location.coordinates)
  end
end
