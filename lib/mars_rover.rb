class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end


  def execute(command)
    return if command.empty?
    
    if command == 'f'
      delta = Coordinates.new(x: 0, y: 1)
    elsif command == 'ff'
      delta = [Coordinates.new(x: 0, y: 1), Coordinates.new(x: 0, y: 1)].reduce(:+)
    end
    @current_coordinates = move_forward_by(delta)
  end

  def coordinates
    @current_coordinates
  end

  private

  def move_forward_by(delta)
    @current_coordinates + delta
  end
end
