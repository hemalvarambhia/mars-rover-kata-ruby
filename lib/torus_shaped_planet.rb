require 'ostruct'
class TorusShapedPlanet
  def initialize(northern_edge:, eastern_edge:, southern_edge:, western_edge:, obstacles: [])
    @northern_edge = northern_edge
    @eastern_edge = eastern_edge
    @southern_edge = southern_edge
    @western_edge = western_edge
    @obstacles = obstacles
  end

  def next_location_to(location, orientation)
    case orientation.direction
    when 'N'
      next_location = Coordinates.new(x: location.x, y: southern_edge) if at_northern_edge?(location)
    when 'E'
      next_location = Coordinates.new(x: western_edge, y: location.y) if at_eastern_edge?(location)
    when 'S'
      next_location = Coordinates.new(x: location.x, y: northern_edge) if at_southern_edge?(location)
    when 'W'
      next_location = Coordinates.new(x: eastern_edge, y: location.y) if at_western_edge?(location)
    end

    next_location ||= location.translate(forward(orientation.direction))

    return location if obstacle_at?(next_location)
    next_location
  end

  def previous_location_to(location, orientation)
    case orientation.direction
    when 'N'
      previous_location = Coordinates.new(x: location.x, y: northern_edge) if at_southern_edge?(location)
    when 'E'
      previous_location = Coordinates.new(x: eastern_edge, y: location.y) if at_western_edge?(location)
    when 'S'
      previous_location = Coordinates.new(x: location.x, y: southern_edge) if at_northern_edge?(location)
    when 'W'
      previous_location = Coordinates.new(x: western_edge, y: location.y) if at_eastern_edge?(location)
    end
    previous_location ||= location.translate(backwards(orientation.direction))

    return location if obstacle_at?(previous_location)
    previous_location
  end

  private

  def forward(direction)
    {
      'N' => OpenStruct.new(x: 0, y: 1),
      'E' => OpenStruct.new(x: 1, y: 0),
      'S' => OpenStruct.new(x: 0, y: -1),
      'W' => OpenStruct.new(x: -1, y: 0)
    }[direction]
  end

  def backwards(direction)
    step_forward = forward(direction)
    OpenStruct.new(x: -step_forward.x, y: -step_forward.y)
  end

  def obstacle_at?(next_location)
    @obstacles.include?(next_location)
  end

  def at_northern_edge?(location)
    location.y == northern_edge
  end

  def at_eastern_edge?(location)
    location.x == eastern_edge
  end

  def at_southern_edge?(location)
    location.y == southern_edge
  end

  def at_western_edge?(location)
    location.x == western_edge
  end

  attr_reader :northern_edge, :eastern_edge, :southern_edge, :western_edge
end
