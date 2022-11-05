class TurnRight
  def initialize(world)
    @world = world
  end

  def execute(location)
    Location.new(world: world, x: location.x, y: location.y, direction: RIGHT[location.direction])
  end

  private

  attr_reader :world

  RIGHT = {
    'W' => 'N',
    'N' => 'E',
    'E' => 'S',
    'S' => 'W'
  }.freeze
  private_constant :RIGHT
end
