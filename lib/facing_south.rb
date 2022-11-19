class FacingSouth
  attr_reader :direction, :left, :right

  def initialize(location)
    @direction = 'S'
    @left = 'E'
    @right = 'W'
  end
end
