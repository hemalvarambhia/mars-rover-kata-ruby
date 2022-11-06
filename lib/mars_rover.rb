class MarsRover
  def self.positioned_at(location)
    new(location)
  end

  def initialize(location)
    @current_position = facing_direction(location)
  end

  def execute(commands)
    commands.split('').select { |command| MarsRover.supported?(command) }.each do |command|
      instruction = {
        'f' => :move_forward,
        'b' => :move_backward,
        'l' => :turn_left,
        'r' => :turn_right
      }[command]
      current_location = @current_position.public_send(instruction)
      @current_position = facing_direction(current_location)
    end
  end

  def position
    @current_location
    @current_position.location
  end

  private

  def self.supported?(command)
    ['f', 'b', 'l', 'r'].include?(command)
  end

  def facing_direction(location)
    case location.direction
    when 'E'
      FacingEast.new(location)
    when 'N'
      FacingNorth.new(location)
    when 'S'
      FacingSouth.new(location)
    when 'W'
      FacingWest.new(location)
    end
  end
end
