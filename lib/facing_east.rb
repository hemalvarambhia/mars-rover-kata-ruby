class FacingEast
  def initialize(location)
    @location = location
  end

  def move_forward
    if location.world.at_right_edge?(location)
      Location.new(world: location.world, x: location.world.left_edge, y: location.y, direction: location.direction)
    else
      Location.new(world: location.world, x: location.x + 1, y: location.y, direction: location.direction)
    end
  end

  def move_backward
    if location.world.at_left_edge?(location)
      Location.new(world: location.world, x: location.world.right_edge, y: location.y, direction: location.direction)
    else
      Location.new(world: location.world, x: location.x - 1, y: location.y, direction: location.direction)
    end
  end

  def turn_left
    Location.new(world: location.world, x: location.x, y: location.y, direction: 'N')
  end

  def turn_right
    Location.new(world: location.world, x: location.x, y: location.y, direction: 'S')
  end

  private

  attr_reader :location
end
