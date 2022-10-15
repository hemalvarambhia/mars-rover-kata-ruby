class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end


  def execute(command)
    return if command.empty?

    movements = command.split('').map { |instruction| movement_for(instruction) }
    delta = movements.reduce(:+)
    @current_coordinates += delta
  end

  def coordinates
    @current_coordinates
  end

  private

  def movement_for(instruction)
    {
      'f' => Coordinates.new(x: 0, y: 1),
      'b' => Coordinates.new(x: 0, y: -1)
    }[instruction] || Coordinates.new(x: 0, y: 0)
  end
end
