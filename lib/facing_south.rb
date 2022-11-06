class FacingSouth
  def initialize(location)
    @location = location
  end

  def move_forward(location = nil)
    if @location.world.at_bottom_edge?(@location)
      Location.new(world: @location.world, x: @location.x, y: @location.world.top_edge, direction: @location.direction)
    else
      Location.new(world: @location.world, x: @location.x, y: @location.y - 1, direction: @location.direction)
    end
  end

  def move_backward(location = nil)
    if @location.world.at_top_edge?(@location)
      Location.new(world: @location.world, x: @location.x, y: @location.world.bottom_edge, direction: @location.direction)
    else
      Location.new(world: @location.world, x: @location.x, y: @location.y + 1, direction: @location.direction)
    end
  end

  def turn_left(location = nil)
    Location.new(world: @location.world, x: @location.x, y: @location.y, direction: 'E')
  end
end
