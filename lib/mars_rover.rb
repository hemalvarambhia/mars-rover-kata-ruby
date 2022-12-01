class MarsRover
  attr_reader :orientation

  def initialize(starting_position:, orientation:)
    @current_position = starting_position
    @orientation = orientation
  end

  def execute(command)
    x = @current_position.x
    case command
    when 'f'
      x = @current_position.x + 1
    when 'b'
      x = @current_position.x - 1
    when 'l'
      @orientation = 'N'
    when 'r'
      @orientation = 'S'
    end

    @current_position = Coordinates.new(x: x, y: @current_position.y)
  end

  def x
    @current_position.x
  end

  def y
    @current_position.y
  end
end