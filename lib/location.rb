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
    case direction
    when 'E'
      FacingEast.new.move_forward(self)
    when 'N'
      FacingNorth.new.move_forward(self)
    when 'S'
      FacingSouth.new.move_forward(self)
    when 'W'
      FacingWest.new.move_forward(self)
    end
  end

  def move_backward
    case direction
    when 'E'
      FacingEast.new.move_backward(self)
    when 'N'
      FacingNorth.new.move_backward(self)
    when 'S'
      FacingSouth.new.move_backward(self)
    when 'W'
      FacingWest.new.move_backward(self)
    end
  end

  def turn_left
    case direction
    when 'E'
      FacingEast.new.turn_left(self)
    when 'N'
      FacingNorth.new.turn_left(self)
    when 'S'
      FacingSouth.new.turn_left(self)
    when 'W'
      FacingWest.new.turn_left(self)
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
