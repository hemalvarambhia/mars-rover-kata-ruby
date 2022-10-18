require 'forwardable'
require_relative './translation'
require_relative './location'
class MarsRover
  extend Forwardable

  def_delegator :@current_location, :direction

  def initialize(starting_coordinates:, direction:)
    @current_location = Location.new(coordinates: starting_coordinates, direction: direction)
  end


  def execute(command)
    command.split('').select(&method(:supported?)).each do |instruction|
      command_instruction = {
        'f' => :move_forward,
        'b' => :move_backward,
        'l' => :turn_left
      }[instruction]
      @current_location = @current_location.public_send(command_instruction)
    end
  end

  def position
    @current_location
  end

  private

  def supported?(instruction)
    ['f', 'b', 'l'].include?(instruction)
  end
end
