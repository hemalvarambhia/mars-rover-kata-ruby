class Backward
  def initialize(world)
    @world = world
  end

  def move(location)
    if world.at_left_edge?(location)
      Location.new(world: world, x: world.right_edge, y: location.y, direction: location.direction)
    else
      Location.new(world: world, x: location.x - 1, y: location.y, direction: location.direction)
    end
  end

  private

  attr_reader :world
end
