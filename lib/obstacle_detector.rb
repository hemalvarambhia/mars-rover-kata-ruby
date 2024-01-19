class ObstacleDetector
  def initialize(obstacles)
    @obstacles = obstacles
  end

  def obstacle_at?(coordinates)
    @obstacles.include?(coordinates)
  end
end
