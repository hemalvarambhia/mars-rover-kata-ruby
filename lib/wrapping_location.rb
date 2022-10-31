require_relative './coordinates'
require_relative './location'
class WrappingLocation < Location
  attr_reader :x, :y, :direction

  def self.infinite(coordinates:, direction:)
    new(
      world: World.new(x_range: (-Float::INFINITY..Float::INFINITY), y_range: (-Float::INFINITY..Float::INFINITY)),
      x: coordinates.x,
      y: coordinates.y,
      direction: direction
    )
  end

  def initialize(world:, x:, y:, direction:)
    @x = x
    @y = y
    @coordinates = Coordinates.new(x: x, y: y)
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
    WrappingLocation.new(world: world, x: x, y: y, direction: on_left_turn[direction])
  end

  def turn_right
    on_right_turn = {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'
    }
    WrappingLocation.new(world: world, x: x, y: y, direction: on_right_turn[direction])
  end

  def move_forward
    case direction
    when 'E'
      if world.at_right_edge?(self)
        WrappingLocation.new(world: world, x: world.left_edge, y: y, direction: direction)
      else
        WrappingLocation.new(world: world, x: x + 1, y: y, direction: direction)
      end
    when 'N'
      if world.at_top_edge?(self)
        WrappingLocation.new(world: world, x: x, y: world.bottom_edge, direction: direction)
      else
        WrappingLocation.new(world: world, x: x, y: y + 1, direction: direction)
      end
    when 'S'
      if world.at_bottom_edge?(self)
        WrappingLocation.new(world: world, x: x, y: world.top_edge, direction: direction)
      else
        WrappingLocation.new(world: world, x: x, y: y - 1, direction: direction)
      end
    when 'W'
      WrappingLocation.new(world: world, x: x - 1, y: y, direction: direction)
    end
  end

  def move_backward
    case direction
    when 'E'
      if world.at_left_edge?(self)
        WrappingLocation.new(world: world, x: world.right_edge, y: y, direction: direction)
      else
        WrappingLocation.new(world: world, x: x - 1, y: y, direction: direction)
      end
    when 'N'
      if world.at_bottom_edge?(self)
        WrappingLocation.new(world: world, x: x, y: world.top_edge, direction: direction)
      else
        WrappingLocation.new(world: world, x: x, y: y - 1, direction: direction)
      end
    when 'S'
      if world.at_top_edge?(self)
        WrappingLocation.new(world: world, x: x, y: world.bottom_edge, direction: direction)
      else
        WrappingLocation.new(world: world, x: x, y: y + 1, direction: direction)
      end
    when 'W'
      WrappingLocation.new(world: world, x: x + 1, y: y, direction: direction)
    end
  end

  def ==(location)
    coordinates == location.coordinates && direction == location.direction
  end

  def to_s
    "(#{x}, #{y})"
  end

  private

  attr_reader :world
end
