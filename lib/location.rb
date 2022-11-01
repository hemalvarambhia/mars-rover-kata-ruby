require_relative './forward'

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
    Forward.new(world).invert.move(self)
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
