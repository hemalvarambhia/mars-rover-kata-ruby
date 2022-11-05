class TurnRight
  def initialize(world)

  end

  def execute(location)
    Location.new(world: location.world, x: location.x, y: location.y, direction: RIGHT[location.direction])
  end

  RIGHT = {
    'W' => 'N',
    'N' => 'E',
    'E' => 'S',
    'S' => 'W'
  }.freeze
  private_constant :RIGHT
end
