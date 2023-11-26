require 'forwardable'
require 'coordinates'
class Location
  extend Forwardable
  attr_reader :coordinates, :direction

  def self.south_facing(coordinates)
    new(coordinates: coordinates, direction: 'S')
  end

  def self.north_facing(coordinates)
    Location.new(coordinates: coordinates, direction: 'N')
  end

  def initialize(coordinates:, direction:)
    @coordinates = coordinates
    @direction = direction
  end

  def forwards
    case @direction
    when 'N'
      Location.new(coordinates: Coordinates.new(x: x, y: y + 1), direction: @direction)
    when 'E'
      Location.new(coordinates: Coordinates.new(x: (x + 1) % 36, y: y), direction: @direction)
    when 'S'
      Location.new(coordinates: Coordinates.new(x: x, y: y - 1), direction: @direction)
    when 'W'
      Location.new(coordinates: Coordinates.new(x: (x - 1) % 36, y: y), direction: @direction)
    end
  end

  def backwards
    case @direction
    when 'N'
      Location.new(coordinates: Coordinates.new(x: x, y: y - 1), direction: @direction)
    when 'E'
      Location.new(coordinates: Coordinates.new(x: (x - 1) % 36, y: y), direction: @direction)
    when 'S'
      Location.new(coordinates: Coordinates.new(x: x, y: y + 1), direction: @direction)
    when 'W'
      Location.new(coordinates: Coordinates.new(x: (x + 1) % 36, y: y), direction: @direction)
    end
  end

  TURN_LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :TURN_LEFT

  TURN_RIGHT = TURN_LEFT.invert
  private_constant :TURN_RIGHT

  def rotate_left
    Location.new(
      coordinates: @coordinates,
      direction: TURN_LEFT[@direction]
    )
  end

  def rotate_right
    Location.new(
      coordinates: @coordinates,
      direction: TURN_RIGHT[@direction]
    )
  end

  def inspect
    "#{coordinates.inspect} facing #{direction}"
  end

  def to_s
    "facing #{direction} starting from #{coordinates}"
  end

  private

  def_delegators :@coordinates, :x, :y
end
