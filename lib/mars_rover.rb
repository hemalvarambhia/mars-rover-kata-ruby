class MarsRover
  attr_reader :orientation

  def initialize(starting_position:, orientation: 'E')
    @current_position = starting_position
    @orientation = orientation
  end

  def execute(command)
    x = @current_position.x
    y = @current_position.y
    if command == 'f'
      x = x + 1
    elsif command == 'b'
      x = x - 1
    elsif command == 'l'
      @orientation = 'N'
    end
    @current_position = Coordinates.new(x: x, y: y)
  end

  def x
    @current_position.x
  end

  def y
    @current_position.y
  end
end