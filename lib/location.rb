require_relative './facing_east'
require_relative './facing_north'
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
      FacingEast.new.move_forward(self)
    when 'N'
      FacingNorth.new.move_forward(self)
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
      FacingEast.new.move_backward(self)
    when 'N'
      FacingNorth.new.move_backward(self)
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
    case direction
    when 'E'
      FacingEast.new.turn_left(self)
    when 'N'
      FacingNorth.new.turn_left(self)
    when 'S'
      Location.new(world: world, x: x, y: y, direction: 'E')
    when 'W'
      Location.new(world: world, x: x, y: y, direction: 'S')
    end
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
