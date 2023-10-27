require 'coordinates'
require 'location'
class MarsRover
  attr_reader :direction, :current_position

  def initialize(direction:, starting_position:)
    @current_position = starting_position
    @direction = direction
    @current_location = Location.new(coordinates: starting_position, direction: direction)
  end

  def execute(commands_from_earth)
    commands_from_earth.each do |command|
      case command
      when 'f'
        @current_location = @current_location.forwards
        @current_position = @current_location.coordinates
      when 'b'
        @current_location = @current_location.backwards
        @current_position = @current_location.coordinates
      when 'l'
        @direction = turn_left(@direction)
      when 'r'
        @direction = turn_right(@direction)
      end
    end
  end

  def current_position
    @current_location.coordinates
  end

  def inspect
    "a Mars Rover at #{@current_position.inspect} facing #{direction}"
  end

  def to_s
    "a Mars Rover facing #{direction} starting from #{@current_position}"
  end

  private

  def turn_right(direction)
    {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N' }[direction]
  end

  def turn_left(direction)
    {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }[direction]
  end
end
