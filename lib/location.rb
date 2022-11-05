class Location
  attr_reader :world, :x, :y, :direction

  def initialize(world:, x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
    @world = world
  end

  def ==(location)
    x == location.x && y == location.y && direction == location.direction
  end

  def move_forward
    case direction
    when 'E'
      if world.at_right_edge?(self)
        Location.new(world: world, x: world.left_edge, y: y, direction: direction)
      else
        Location.new(world: world, x: x + 1, y: y, direction: direction)
      end
    when 'N'
      if world.at_top_edge?(self)
        Location.new(world: world, x: x, y: world.bottom_edge, direction: direction)
      else
        Location.new(world: world, x: x, y: y + 1, direction: direction)
      end
    when 'S'
      if world.at_bottom_edge?(self)
        Location.new(world: world, x: x, y: world.top_edge, direction: direction)
      else
        Location.new(world: world, x: x, y: y - 1, direction: direction)
      end
    when 'W'
      if world.at_left_edge?(self)
        Location.new(world: world, x: world.right_edge, y: y, direction: direction)
      else
        Location.new(world: world, x: x - 1, y: y, direction: direction)
      end
    end
  end

  def move_backward
    case direction
    when 'E'
      if world.at_left_edge?(self)
        Location.new(world: world, x: world.right_edge, y: y, direction: direction)
      else
        Location.new(world: world, x: x - 1, y: y, direction: direction)
      end
    when 'N'
      if world.at_bottom_edge?(self)
        Location.new(world: world, x: x, y: world.top_edge, direction: direction)
      else
        Location.new(world: world, x: x, y: y - 1, direction: direction)
      end
    when 'S'
      if world.at_top_edge?(self)
        Location.new(world: world, x: x, y: world.bottom_edge, direction: direction)
      else
        Location.new(world: world, x: x, y: y + 1, direction: direction)
      end
    when 'W'
      if world.at_right_edge?(self)
        Location.new(world: world, x: world.left_edge, y: y, direction: direction)
      else
        Location.new(world: world, x: x + 1, y: y, direction: direction)
      end
    end
  end

  def turn_left
    Location.new(world: world, x: x, y: y, direction: LEFT[direction])
  end

  def turn_right
    Location.new(world: world, x: x, y: y, direction: LEFT.invert[direction])
  end

  def inspect
    "(#{x}, #{y}), facing #{direction}"
  end

  LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :LEFT
end
