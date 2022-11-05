require_relative './turn_right'
class TurnLeft
  def initialize(world)
    @world = world
  end

  def invert
    TurnRight.new(world)
  end

  def execute(location)
    Location.new(world: world, x: location.x, y: location.y, direction: LEFT[location.direction])
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
