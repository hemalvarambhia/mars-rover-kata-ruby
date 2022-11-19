class FacingWest
  attr_reader :left, :right

  def initialize(location)
    @location = location
    @left = 'S'
    @right = 'N'
  end
end
