require_relative './mars_rover'
class VehicleController

  def execute(commands)
    VehicleController.supported(commands).each do |command|
      instruction = VehicleController.instruction_from(command)
      @vehicle.public_send(instruction)
    end
  end

  def current_position
    @vehicle.current_position
  end

  def orientation
    @vehicle.orientation
  end

  def self.supported(commands)
    supported_commands = %w{f b l r}
    commands.split('').select { |command| supported_commands.include?(command) }
  end

  def self.instruction_from(command)
    {
      'f' => :move_forward,
      'b' => :move_backwards,
      'l' => :turn_left,
      'r' => :turn_right
    }[command]
  end

  private

  def initialize(vehicle:)
    @vehicle = vehicle
  end
end