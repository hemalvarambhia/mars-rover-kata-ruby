class Planet
  attr_reader :northern_edge, :eastern_edge, :southern_edge, :western_edge

  def initialize(northern_edge:, eastern_edge: 5, southern_edge:, western_edge: -5)
    @northern_edge = northern_edge
    @eastern_edge = eastern_edge
    @southern_edge = southern_edge
    @western_edge = western_edge
  end

  def at_northern_edge?(location)
    location.y == northern_edge
  end

  def at_eastern_edge?(location)
    location.x == eastern_edge
  end

  def at_southern_edge?(location)
    location.y == southern_edge
  end
end
