class Location
  attr_reader :coordinates, :direction
  def initialize(coordinates:, direction:)
    @coordinates = coordinates
    @direction = direction
  end

  def forwards
    case @direction
    when 'N'
      Location.new(
        coordinates: Coordinates.new(x: @coordinates.x, y: @coordinates.y + 1),
        direction: @direction
      )
    when 'E'
      Location.new(
        coordinates: Coordinates.new(x: @coordinates.x + 1, y: @coordinates.y),
        direction: @direction
      )
    when 'S'
      Location.new(
        coordinates: Coordinates.new(x: @coordinates.x, y: @coordinates.y - 1),
        direction: @direction
      )
    when 'W'
      Location.new(
        coordinates: Coordinates.new(x: @coordinates.x - 1, y: @coordinates.y),
        direction: @direction
      )
    end
  end

  def backwards
    case @direction
    when 'N'
      Location.new(
        coordinates: Coordinates.new(x: @coordinates.x, y: @coordinates.y - 1),
        direction: @direction
      )
    when 'E'
      Location.new(
        coordinates: Coordinates.new(x: @coordinates.x - 1, y: @coordinates.y),
        direction: @direction
      )
    when 'S'
      Location.new(
        coordinates: Coordinates.new(x: @coordinates.x, y: @coordinates.y + 1),
        direction: @direction
      )
    when 'W'
      Location.new(
        coordinates: Coordinates.new(x: @coordinates.x + 1, y: @coordinates.y),
        direction: @direction
      )
    end
  end

  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  def rotate_left
    Location.new(
      coordinates: @coordinates,
      direction: TURN_LEFT[@direction]
    )
  end

  def rotate_right
    Location.new(
      coordinates: @coordinates,
      direction: TURN_LEFT.invert[@direction]
    )
  end
end
