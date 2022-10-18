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
    command.split('').each do |instruction|
      case instruction
      when 'f'
        command_instruction = :move_forward
        @current_location = @current_location.public_send(command_instruction)
      when 'b'
        command_instruction = :move_backward
        @current_location = @current_location.public_send(command_instruction)
      when 'l'
        command_instruction = :turn_left
        @current_location = @current_location.public_send(command_instruction)
      end
    end
  end

  def position
    @current_location
  end
end
