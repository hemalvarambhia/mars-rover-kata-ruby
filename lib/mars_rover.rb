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

      send(instruction)
    end
  end

  def position
    @current_location
  end

  def direction
    @direction
  end

  private

  attr_reader :world

  def self.supported?(command)
    ['f', 'b', 'l', 'r'].include?(command)
  end

  def move_forward
    @current_location = world.next_location(@current_location, @direction)
  end

  def move_backward
    @current_location = world.previous_location(@current_location, @direction)
  end

  def turn_left
    @direction = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }[@direction]
    @current_location = Position.new(x: @current_location.x, y: @current_location.y, direction: @direction)
  end

  def turn_right
    @direction = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }.invert[@direction]
    @current_location = Position.new(x: @current_location.x, y: @current_location.y, direction: @direction)
  end

  def orientation(direction)
    {
      'N' => FacingNorth.new,
      'E' => FacingEast.new,
      'S' => FacingSouth.new,
      'W' => FacingWest.new
    }[direction]
  end
end
