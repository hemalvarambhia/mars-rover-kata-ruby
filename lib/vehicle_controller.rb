require_relative './mars_rover'
class VehicleController

  def execute(commands)
    commands.split('').select { |command| %w{f b l r}.include?(command) }.each do |command|
      instruction = instruction_from(command)
      @vehicle.public_send(instruction)
    end
  end

  def current_position
    @vehicle.current_position
  end

  def orientation
    @vehicle.orientation
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

  def initialize(starting_position:, orientation:, vehicle: MarsRover.new(starting_position: starting_position, orientation: orientation))
    @vehicle = vehicle
  end
end