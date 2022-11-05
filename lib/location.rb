require_relative './move_forward'
require_relative './turn_left'

class Location
  attr_reader :world, :x, :y, :direction

  def initialize(world:, x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
    @world = world
  end

  def turn_left
    TurnLeft.new(world).execute(self)
  end

  def turn_right
    TurnLeft.new(world).invert.execute(self)
  end

  def move_forward
    MoveForward.new(world).execute(self)
  end

  def move_backward
    MoveForward.new(world).invert.execute(self)
  end

  def ==(location)
    x == location.x && y == location.y && direction == location.direction
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
