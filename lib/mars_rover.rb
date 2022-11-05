class MarsRover
  def self.positioned_at(location)
    new(location)
  end

  def initialize(location)
    @current_location = location
  end

  def execute(commands)
    commands.split('').select { |command| MarsRover.supported?(command) }.each do |command|
      instruction = {
        'f' => MoveForward.new,
        'b' => MoveBackward.new,
        'l' => TurnLeft.new,
        'r' => TurnRight.new
      }[command]
      @current_location = instruction.execute(@current_location)
    end
  end

  def position
    @current_location
  end

  private

  def self.supported?(command)
    ['f', 'b', 'l', 'r'].include?(command)
  end
end
