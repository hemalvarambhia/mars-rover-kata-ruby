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
    @current_location = location
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
        @current_location = Position.new(x: @current_location.x, y: @current_location.y, direction: @direction)
      else
        send(instruction)
      end
    end
  end

  def position
    @current_location
  end

  private

  attr_reader :world

  def self.supported?(command)
    ['f', 'b', 'l', 'r'].include?(command)
  end

  def move_forward
    @current_location = world.next_location(@current_location)
  end

  def move_backward
    @current_location = world.previous_location(@current_location)
  end

  def turn_left
    @direction = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }[@direction]
    @current_location = Position.new(x: @current_location.x, y: @current_location.y, direction: @direction)
    @direction
  end

  def turn_right
    @direction = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }.invert[@direction]
    @current_location = Position.new(x: @current_location.x, y: @current_location.y, direction: @direction)
    @direction
  end
end
