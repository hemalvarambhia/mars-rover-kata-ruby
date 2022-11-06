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
    facing_direction.move_forward
  end

  def move_backward
    facing_direction.move_backward
  end

  def turn_left
    facing_direction.turn_left
  end

  def turn_right
    facing_direction.turn_right
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
      FacingEast.new(self)
    when 'N'
      FacingNorth.new(self)
    when 'S'
      FacingSouth.new(self)
    when 'W'
      FacingWest.new(self)
    end
  end
end
