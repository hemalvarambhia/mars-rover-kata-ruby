require_relative './facing_east'
require_relative './facing_north'
require_relative './facing_south'
require_relative './facing_west'
class MarsRover
  def self.positioned_at(world, location)
    new(world, location)
  end

  def initialize(world, location)
    @world = world
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
      current_location = send(instruction)
      @current_position = facing_direction(current_location)
    end
  end

  def position
    @current_position.location
  end

  def direction
    @current_position.direction
  end

  private

  attr_reader :world

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

  def move_forward
    world.next_location(@current_position)
  end

  def move_backward
    world.previous_location(@current_position)
  end

  def turn_left
    @current_position.public_send(:turn_left)
  end

  def turn_right
    @current_position.public_send(:turn_right)
  end
end
