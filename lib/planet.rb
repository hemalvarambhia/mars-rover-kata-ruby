class Planet
  attr_reader :northern_edge, :southern_edge

  def initialize(northern_edge: 5, southern_edge: -5)
    @northern_edge = northern_edge
    @southern_edge = southern_edge
  end

  def at_northern_edge?(location)
    location.y == northern_edge
  end
end
