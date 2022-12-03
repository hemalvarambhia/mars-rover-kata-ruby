class Direction
  attr_reader :direction, :left, :right

  def self.north
    new(direction: 'N', left: 'E', right: 'W')
  end

  def self.east
    new(direction: 'E', left: 'S', right: 'N')
  end

  def initialize(direction:, left:, right:)
    @direction = direction
    @left = left
    @right = right
  end
end
