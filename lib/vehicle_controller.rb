require_relative './mars_rover'
class VehicleController

  def execute(commands)
    VehicleController.supported(commands).each do |command|
      instruction = VehicleController.instruction_from(command)
      instruction.call(@vehicle)
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
      'f' => lambda { |vehicle| vehicle.move_forward },
      'b' => lambda { |vehicle| vehicle.move_backwards },
      'l' => lambda { |vehicle| vehicle.turn_left },
      'r' => lambda { |vehicle| vehicle.turn_right }
    }[command]
  end

  private

  def initialize(vehicle:)
    @vehicle = vehicle
  end
end