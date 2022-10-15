class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end


  def execute(command)
    if command == 'f'
      delta = Coordinates.new(x: 0, y: 1)
      @current_coordinates = move_forward_by(delta)
    elsif command == 'ff'
      delta = Coordinates.new(x: 0, y: 2)
      @current_coordinates = move_forward_by(delta)
    end
  end

  def coordinates
    @current_coordinates
  end

  private

  def move_forward_by(delta)
    Coordinates.new(x: @current_coordinates.x + delta.x, y: @current_coordinates.y + delta.y)
  end
end
