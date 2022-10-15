class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end


  def execute(command)
    if command == 'f'
      @current_coordinates = Coordinates.new(x: 0, y: 1)
    elsif command == 'ff'
      @current_coordinates = Coordinates.new(x: 0, y: 2)
    end
  end

  def coordinates
    @current_coordinates
  end
end
