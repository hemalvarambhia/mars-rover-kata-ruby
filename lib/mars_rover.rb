class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end


  def execute(command)
    if command == 'f'
      delta = Coordinates.new(x: 0, y: 1)
      @current_coordinates = Coordinates.new(x: @current_coordinates.x + delta.x, y: @current_coordinates.y + delta.y)
    elsif command == 'ff'
      delta = Coordinates.new(x: 0, y: 2)
      @current_coordinates = Coordinates.new(x: @current_coordinates.x + delta.x, y: @current_coordinates.y + delta.y)
    end
  end

  def coordinates
    @current_coordinates
  end
end
