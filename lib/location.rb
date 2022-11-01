require_relative './forward'
require_relative './backward'

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
    Location.new(world: world, x: x, y: y, direction: LEFT[direction])
  end

  def turn_right
    Location.new(world: world, x: x, y: y, direction: LEFT.invert[direction])
  end

  def move_forward
    Forward.new(world).move(self)
  end

  def move_backward
    case direction
    when 'E'
      Backward.new(world).move(self)
    when 'N'
      Backward.new(world).move(self)
    when 'S'
      Backward.new(world).move(self)
    when 'W'
      Backward.new(world).move(self)
    end
  end

  def ==(location)
    x == location.x && y == location.y && direction == location.direction
  end

  def to_s
    "(#{x}, #{y}), facing #{direction}"
  end

  private

  attr_reader :world

  LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :LEFT
end
