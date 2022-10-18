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
      case instruction
      when 'f'
        command_instruction = :move_forward
      when 'b'
        command_instruction = :move_backward
      when 'l'
        command_instruction = :turn_left
      end
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
