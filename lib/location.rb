require_relative './facing_east'
require_relative './facing_north'
require_relative './facing_south'
require_relative './facing_west'
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
    facing_direction.move_forward(self)
  end

  def move_backward
    facing_direction.move_backward(self)
  end

  def turn_left
    facing_direction.turn_left(self)
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

  private

  def facing_direction
    case direction
    when 'E'
      FacingEast.new
    when 'N'
      FacingNorth.new
    when 'S'
      FacingSouth.new
    when 'W'
      FacingWest.new
    end
  end
end
