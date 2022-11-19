class FacingSouth
  attr_reader :left, :right

  def initialize(location)
    @location = location
    @left = 'E'
    @right = 'W'
  end
end
