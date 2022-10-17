require_relative './translation'
class MarsRover
  attr_reader :direction

  def initialize(starting_coordinates:, direction:)
    @current_coordinates = starting_coordinates
    @direction = direction
  end


  def execute(command)
    movements = to_movements(command)
    translation = movements.reduce(:+)
    @current_coordinates = @current_coordinates.translate(translation)
  end

  def coordinates
    @current_coordinates
  end

  private

  def to_movements(command)
    if command.empty?
      [ Translation.no_where ]
    else
      command.split('').map { |instruction| movement_for(instruction) }
    end
  end

  def movement_for(instruction)
    case direction
    when 'N'
      {
        'f' => Translation.forward(direction),
        'b' => Translation.backward(direction)
      }[instruction] || Translation.no_where
    when 'E'
      {
        'f' => Translation.forward(direction),
        'b' => Translation.backward(direction)
      }[instruction] || Translation.no_where
    when 'S'
      {
        'f' => Translation.forward(direction),
        'b' => Translation.backward(direction)
      }[instruction] || Translation.no_where
    end
  end
end
