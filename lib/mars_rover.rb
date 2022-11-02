class MarsRover
  def self.positioned_at(location)
    new(
      world: location.world,
      starting_coordinates: Coordinates.new(x: location.x, y: location.y),
      direction: location.direction
    )
  end

  def initialize(world:, starting_coordinates:, direction:)
    @current_location =
      Location.new(
        world: world,
        x: starting_coordinates.x,
        y: starting_coordinates.y,
        direction: direction
      )
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
