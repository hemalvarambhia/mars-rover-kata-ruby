class FacingNorth
  def initialize(location)
    @location = location
  end

  def move_forward
    if location.world.at_top_edge?(location)
      Location.new(world: location.world, x: location.x, y: location.world.bottom_edge, direction: location.direction)
    else
      Location.new(world: location.world, x: location.x, y: location.y + 1, direction: location.direction)
    end
  end

  def move_backward
    if location.world.at_bottom_edge?(location)
      Location.new(world: location.world, x: location.x, y: location.world.top_edge, direction: location.direction)
    else
      Location.new(world: location.world, x: location.x, y: location.y - 1, direction: location.direction)
    end
  end

  def turn_left
    Location.new(world: location.world, x: location.x, y: location.y, direction: 'W')
  end

  def turn_right
    Location.new(world: location.world, x: location.x, y: location.y, direction: 'E')
  end

  private

  attr_reader :location
end
