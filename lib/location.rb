class Location
  attr_reader :x, :y, :direction

  def self.infinite(coordinates:, direction:)
    new(
      world: World.infinite,
      x: coordinates.x,
      y: coordinates.y,
      direction: direction
    )
  end

  def initialize(world:, x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
    @world = world
  end

  def turn_left
    on_left_turn = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }
    Location.new(world: world, x: x, y: y, direction: on_left_turn[direction])
  end

  def turn_right
    on_right_turn = {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'
    }
    Location.new(world: world, x: x, y: y, direction: on_right_turn[direction])
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

  def ==(location)
    x == location.x && y == location.y && direction == location.direction
  end

  def to_s
    "(#{x}, #{y})"
  end

  private

  attr_reader :world
end
