require_relative './facing_east'
require_relative './facing_north'
require_relative './facing_south'
require_relative './facing_west'
class MarsRover
  attr_reader :direction

  def self.positioned_at(world, location)
    new(world, location)
  end

  def initialize(world, location)
    @world = world
    @direction = location.direction
    @current_position = facing_direction(location, @direction)
  end

  def execute(commands)
    commands.split('').select { |command| MarsRover.supported?(command) }.each do |command|
      instruction = {
        'f' => :move_forward,
        'b' => :move_backward,
        'l' => :turn_left,
        'r' => :turn_right
      }[command]
      case instruction
      when :turn_left, :turn_right
        @direction = send(instruction)
        @current_position = facing_direction(Position.new(x: @current_position.x, y: @current_position.y, direction: @direction), @direction)
      else
        current_location = send(instruction)
        @current_position = facing_direction(current_location, current_location.direction)
      end
    end
  end

  def position
    @current_position.location
  end

  private

  attr_reader :world

  def self.supported?(command)
    ['f', 'b', 'l', 'r'].include?(command)
  end

  def facing_direction(location, direction)
    case direction
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
    {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }[@direction]
  end

  def turn_right
    {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }.invert[@direction]
  end
end
