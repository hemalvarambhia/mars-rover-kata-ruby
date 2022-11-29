class MarsRover
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def execute(command)
    if command == 'f'
      @x = @x + 1
    end
  end
end