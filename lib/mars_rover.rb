require 'forwardable'
require_relative './location'
require_relative './wrapping_location'
class MarsRover
  extend Forwardable

  def_delegator :@current_location, :direction

  def initialize(starting_coordinates:, direction:)
    @current_location =
      WrappingLocation.new(
        world: World.new(x_range: (-Float::INFINITY..Float::INFINITY), y_range: (-Float::INFINITY..Float::INFINITY)),
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
