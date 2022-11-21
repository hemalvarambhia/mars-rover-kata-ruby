class World
  def self.infinite
    new(
      x_range: (-Float::INFINITY..Float::INFINITY),
      y_range: (-Float::INFINITY..Float::INFINITY)
    )
  end

  def initialize(x_range:, y_range:, obstacles: [])
    @x_range = x_range
    @y_range = y_range
    @obstacles = obstacles
  end

  def next_location(location, direction)
    case direction
    when 'N'
      if at_top_edge?(location)
        Position.new(x: location.x, y: bottom_edge, direction: location.direction)
      else
        Position.new(x: location.x, y: location.y + 1, direction: location.direction)
      end
    when 'E'
      if at_right_edge?(location)
        next_location = Position.new(x: left_edge, y: location.y, direction: location.direction)
        return location if obstacle_at?(next_location)
        next_location
      else
        next_location = Position.new(x: location.x + 1, y: location.y, direction: location.direction)
        return location if obstacle_at?(next_location)
        next_location
      end
    when 'S'
      if at_bottom_edge?(location)
        Position.new(x: location.x, y: top_edge, direction: location.direction)
      else
        Position.new(x: location.x, y: location.y - 1, direction: location.direction)
      end
    when 'W'
      if at_left_edge?(location)
        Position.new(x: right_edge, y: location.y, direction: location.direction)
      else
        Position.new(x: location.x - 1, y: location.y, direction: location.direction)
      end
    end
  end

  def previous_location(location, direction)
    case direction
    when 'N'
      if at_bottom_edge?(location)
        Position.new(x: location.x, y: top_edge, direction: location.direction)
      else
        Position.new(x: location.x, y: location.y - 1, direction: location.direction)
      end
    when 'E'
      if at_left_edge?(location)
        Position.new(x: right_edge, y: location.y, direction: location.direction)
      else
        next_location = Position.new(x: location.x - 1, y: location.y, direction: location.direction)
        return location if @obstacles.include? next_location
        next_location
      end
    when 'S'
      if at_top_edge?(location)
        Position.new(x: location.x, y: bottom_edge, direction: location.direction)
      else
        Position.new(x: location.x, y: location.y + 1, direction: location.direction)
      end
    when 'W'
      if at_right_edge?(location)
        Position.new(x: left_edge, y: location.y, direction: location.direction)
      else
        Position.new(x: location.x + 1, y: location.y, direction: location.direction)
      end
    end
  end

  private

  attr_reader :x_range, :y_range

  def obstacle_at?(location)
    @obstacles.include? location
  end

  def top_edge
    y_range.last
  end

  def bottom_edge
    y_range.first
  end

  def left_edge
    x_range.first
  end

  def right_edge
    x_range.last
  end

  def at_left_edge?(location)
    location.x == left_edge
  end

  def at_right_edge?(location)
    location.x == right_edge
  end

  def at_top_edge?(location)
    location.y == y_range.last
  end

  def at_bottom_edge?(location)
    location.y == y_range.first
  end
end
