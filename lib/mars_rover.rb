class MarsRover
  def self.positioned_at(location)
    new(location)
  end

  def initialize(location)
    @current_location = location
  end

  def execute(commands)
    commands.split('').select(&method(:supported?)).each do |command|
      instruction = {
        'f' => :move_forward,
        'b' => :move_backward,
        'l' => :turn_left,
        'r' => :turn_right
      }[command]
      @current_location = @current_location.public_send(instruction)
    end
  end

  def position
    @current_location
  end

  private

  def supported?(instruction)
    ['f', 'b', 'l', 'r'].include?(instruction)
  end
end
