class MarsRover
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
    @current_position = Coordinates.new(x: x, y: y)
  end

  def execute(command)
    if command == 'f'
      @x = @x + 1
    elsif command == 'b'
      @x = @x - 1
    end
    @current_position = Coordinates.new(x: @x, y: @y)
  end

  def direction
    'E'
  end
end