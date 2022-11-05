class MarsRover
  def self.positioned_at(location)
    new(location)
  end

  def initialize(location)
    @current_location = location
  end

  def execute(commands)
    commands.split('').select { |instruction| MarsRover.supported?(instruction) }.each do |command|
      instruction = {
        'f' => :move_forward,
        'b' => :move_backward,
        'l' => :turn_left,
        'r' => :turn_right
      }[command]
      @current_location = send(instruction)
    end
  end

  def position
    @current_location
  end

  private

  def self.supported?(instruction)
    ['f', 'b', 'l', 'r'].include?(instruction)
  end

  def turn_left
    TurnLeft.new(@current_location.world).execute(@current_location)
  end

  def turn_right
    TurnLeft.new(@current_location.world).invert.execute(@current_location)
  end

  def move_forward
    MoveForward.new(@current_location.world).execute(@current_location)
  end

  def move_backward
    MoveForward.new(@current_location.world).invert.execute(@current_location)
  end

end
