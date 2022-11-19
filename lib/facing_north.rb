class FacingNorth
  attr_reader :left, :right

  def initialize(location)
    @location = location
    @left = 'W'
    @right = 'E'
  end
end
