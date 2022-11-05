require_relative './turn_right'
class TurnLeft
  def initialize(world)

  end

  def invert
    TurnRight.new(nil)
  end

  def execute(location)
    Location.new(world: location.world, x: location.x, y: location.y, direction: LEFT[location.direction])
  end

  LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :LEFT
end
