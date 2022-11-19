class FacingWest
  attr_reader :direction, :left, :right

  def initialize(location)
    @direction = 'W'
    @left = 'S'
    @right = 'N'
  end
end
