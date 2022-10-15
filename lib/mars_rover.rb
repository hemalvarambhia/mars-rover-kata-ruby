class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end


  def execute(command)
    return if command.empty?

    if command == 'f'
      movements = [ movement_for('f') ]
      delta = movements.reduce(:+)
    elsif command == 'ff'
      movements = [ movement_for('f'), movement_for('f') ]
      delta = movements.reduce(:+)
    end
    @current_coordinates = move_forward_by(delta)
  end

  def coordinates
    @current_coordinates
  end

  private

  def movement_for(instruction)
    {
      'f' => Coordinates.new(x: 0, y: 1)
    }[instruction]
  end

  def move_forward_by(delta)
    @current_coordinates + delta
  end
end
