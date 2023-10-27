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
end
