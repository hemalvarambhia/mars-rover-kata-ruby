require 'ostruct'
class Planet
  def initialize(northern_edge:, eastern_edge:, southern_edge:, western_edge:, obstacles: [])
    @northern_edge = northern_edge
    @eastern_edge = eastern_edge
    @southern_edge = southern_edge
    @western_edge = western_edge
    @obstacles = obstacles
  end

  def next_location_to(location, orientation)
    case orientation.direction
    when 'N'
      next_location = if at_northern_edge?(location)
                        Coordinates.new(x: location.x, y: southern_edge)
                      else
                        location.translate(OpenStruct.new(x: 0, y: 1))
                      end
    when 'E'
      next_location = if at_eastern_edge?(location)
                        Coordinates.new(x: western_edge, y: location.y)
                      else
                        location.translate(OpenStruct.new(x: 1, y: 0))
                      end
    when 'S'
      next_location = if at_southern_edge?(location)
                       Coordinates.new(x: location.x, y: northern_edge)
                     else
                       location.translate(OpenStruct.new(x: 0, y: -1))
                     end
    when 'W'
      next_location = if at_western_edge?(location)
                        Coordinates.new(x: eastern_edge, y: location.y)
                      else
                        location.translate(OpenStruct.new(x: -1, y: 0))
                      end
    end

    return location if obstacle_at?(next_location)
    next_location
  end

  def previous_location_to(location, orientation)
    case orientation.direction
    when 'N'
      previous_location = if at_southern_edge?(location)
                            Coordinates.new(x: location.x, y: northern_edge)
                          else
                            location.translate(OpenStruct.new(x: 0, y: -1))
                          end
    when 'E'
      previous_location = if at_western_edge?(location)
                            Coordinates.new(x: eastern_edge, y: location.y)
                          else
                            location.translate(OpenStruct.new(x: -1, y: 0))
                          end
    when 'S'
      previous_location = if at_northern_edge?(location)
                            Coordinates.new(x: location.x, y: southern_edge)
                          else
                            location.translate(OpenStruct.new(x: 0, y: 1))
                          end
    when 'W'
      previous_location = if at_eastern_edge?(location)
                            Coordinates.new(x: western_edge, y: location.y)
                          else
                            location.translate(OpenStruct.new(x: 1, y: 0))
                          end
    end

    return location if obstacle_at?(previous_location)
    previous_location
  end

  private

  def obstacle_at?(next_location)
    @obstacles.include?(next_location)
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

  def at_western_edge?(location)
    location.x == western_edge
  end

  attr_reader :northern_edge, :eastern_edge, :southern_edge, :western_edge
end
