class Planet
  def initialize(northern_edge:, eastern_edge:, southern_edge:, western_edge:, obstacles: [])
    @northern_edge = northern_edge
    @eastern_edge = eastern_edge
    @southern_edge = southern_edge
    @western_edge = western_edge
    @obstacles = obstacles
  end

  def next_location_to(location, orientation)
    case orientation
    when 'N'
      if at_northern_edge?(location)
        Coordinates.new(x: location.x, y: southern_edge)
      else
        next_location = Coordinates.new(x: location.x, y: location.y + 1)
        return location if @obstacles.include?(next_location)
        next_location
      end
    when 'E'
      if at_eastern_edge?(location)
        Coordinates.new(x: western_edge, y: location.y)
      else
        Coordinates.new(x: location.x + 1, y: location.y)
      end
    when 'S'
      if at_southern_edge?(location)
        Coordinates.new(x: location.x, y: northern_edge)
      else
        Coordinates.new(x: location.x, y: location.y - 1)
      end
    when 'W'
      if at_western_edge?(location)
        Coordinates.new(x: eastern_edge, y: location.y)
      else
        Coordinates.new(x: location.x - 1, y: location.y)
      end
    end
  end

  def previous_location_to(location, orientation)
    case orientation
    when 'N'
      if at_southern_edge?(location)
        Coordinates.new(x: location.x, y: northern_edge)
      else
        Coordinates.new(x: location.x, y: location.y - 1)
      end
    when 'E'
      if at_western_edge?(location)
        Coordinates.new(x: eastern_edge, y: location.y)
      else
        Coordinates.new(x: location.x - 1, y: location.y)
      end
    when 'S'
      if at_northern_edge?(location)
        Coordinates.new(x: location.x, y: southern_edge)
      else
        Coordinates.new(x: location.x, y: location.y + 1)
      end
    when 'W'
      if at_eastern_edge?(location)
        Coordinates.new(x: western_edge, y: location.y)
      else
        Coordinates.new(x: location.x + 1, y: location.y)
      end
    end
  end

  private

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
