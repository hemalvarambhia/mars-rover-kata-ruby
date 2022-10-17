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
        'f' => Translation.forward,
        'b' => Translation.new(delta_x: 0, delta_y: -1)
      }[instruction] || Translation.no_where
    when 'E'
      {
        'f' => Translation.new(delta_x: 1, delta_y: 0),
        'b' => Translation.new(delta_x: -1, delta_y: 0)
      }[instruction] || Translation.no_where
    when 'S'
      {
        'f' => Translation.new(delta_x: 0, delta_y: -1),
        'b' => Translation.new(delta_x: 0, delta_y: 1)
      }[instruction] || Translation.no_where
    end
  end
end
