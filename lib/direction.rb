require 'ostruct'
class Direction
  attr_reader :direction, :left, :right

  def self.north
    new(direction: 'N', left: 'W', right: 'E')
  end

  def self.east
    new(direction: 'E', left: 'N', right: 'S')
  end

  def self.south
    new(direction: 'S', left: 'E', right: 'W')
  end

  def self.west
    new(direction: 'W', left: 'S', right: 'N')
  end

  def step_forward
    case direction
    when 'N'
      OpenStruct.new(x: 0, y: 1)
    when 'E'
      OpenStruct.new(x: 1, y: 0)
    when 'S'
      OpenStruct.new(x: 0, y: -1)
    when 'W'
      OpenStruct.new(x: -1, y: 0)
    end
  end

  def step_backwards
    case direction
    when 'N'
      OpenStruct.new(x: 0, y: -1)
    when 'E'
      OpenStruct.new(x: -1, y: 0)
    when 'S'
      OpenStruct.new(x: 0, y: 1)
    when 'W'
      OpenStruct.new(x: 1, y: 0)
    end
    OpenStruct.new(x: -step_forward.x, y: -step_forward.y)
  end

  private
  def initialize(direction:, left:, right:)
    @direction = direction
    @left = left
    @right = right
  end
end
