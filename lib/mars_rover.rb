require_relative './facing_east'
require_relative './facing_north'
require_relative './facing_south'
require_relative './facing_west'
class MarsRover
  def self.positioned_at(location)
    new(location)
  end

  def initialize(location)
    @world = location.world
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
      current_location = if instruction == :move_forward
                           public_send(instruction)
                         elsif instruction == :move_backward
                           public_send(instruction)
                         else
                           @current_position.public_send(instruction)
                         end
      @current_position = facing_direction(current_location)
    end
  end

  def position
    @current_position.location
  end

  def direction
    @current_position.direction
  end

  def move_forward
    world.next_location(@current_position)
  end

  def move_backward
    world.previous_location(@current_position)
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
end
