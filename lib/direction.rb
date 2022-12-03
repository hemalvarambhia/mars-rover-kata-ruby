class Direction
  attr_reader :direction, :left, :right

  def self.north
    new(direction: 'N', left: 'W', right: 'E')
  end

  def self.east
    new(direction: 'E', left: 'S', right: 'N')
  end

  def self.south
    new(direction: 'S', left: nil, right: nil)
  end

  def initialize(direction:, left:, right:)
    @direction = direction
    @left = left
    @right = right
  end
end
