class NonPolarMap
  def forwards(location)
    case location.direction
    when 'N'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y + 1), direction: location.direction)
    when 'E'
      Location.new(coordinates: Coordinates.new(x: (location.x + 1) % 36, y: location.y), direction: location.direction)
    when 'S'
      Location.new(coordinates: Coordinates.new(x: location.x, y: location.y - 1), direction: location.direction)
    when 'W'
      Location.new(coordinates: Coordinates.new(x: (location.x - 1) % 36, y: location.y), direction: location.direction)
    end
  end

  def backwards(location)
    location.backwards
  end
end
