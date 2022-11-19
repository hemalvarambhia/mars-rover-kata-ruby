class FacingEast
  attr_reader :left, :right

  def initialize(location)
    @location = location
    @left = 'N'
    @right = 'S'
  end
end
