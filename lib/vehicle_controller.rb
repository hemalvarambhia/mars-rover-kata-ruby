require_relative './direction'
require_relative './mars_rover'
class VehicleController

  def execute(commands)
    commands.split('').select { |command| %w{f b l r}.include?(command) }.each do |command|
      instruction = instruction_from(command)
      @mars_rover.public_send(instruction)
    end
  end

  def current_position
    @mars_rover.current_position
  end

  def orientation
    @mars_rover.orientation
  end

  private

  def instruction_from(command)
    {
      'f' => :move_forward,
      'b' => :move_backwards,
      'l' => :turn_left,
      'r' => :turn_right
    }[command]
  end

  def initialize(starting_position:, orientation:)
    @current_position = starting_position
    @orientation = orientation
    @northern_edge = 5
    @southern_edge = -5
    @mars_rover = MarsRover.new(starting_position: starting_position, orientation: orientation)
  end
end