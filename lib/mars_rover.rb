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
        @current_location = @current_location.public_send(:move_forward)
      when 'b'
        @current_location = @current_location.public_send(:move_backward)
      when 'l'
        @current_location = @current_location.public_send(:turn_left)
      end
    end
  end

  def position
    @current_location
  end
end
