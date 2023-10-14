RSpec.describe 'Operating a Mars rover' do
  class Coordinate
    attr_reader :x, :y
    def initialize(x:, y:)
      @x = x
      @y = y
    end
  end
  class MarsRover
    def initialize(x: 0, y: 0)
      @current_position = Coordinate.new(x: x, y: y)
    end

    def x
      @current_position.x
    end

    def y
      @current_position.y
    end
  end

  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(x: 0, y: 0)

    expected_coordinate = Coordinate.new(x: 0, y: 0)
    expect(mars_rover.x).to(eq(expected_coordinate.x), "Expected Mars Rover's x-coordinate to be 0, but got #{mars_rover.x}")
    expect(mars_rover.y).to(eq(expected_coordinate.y), "Expected Mars Rover's y-coordinate to be 0, but got #{mars_rover.y}")
  end

  it 'has a starting position anywhere on the planet' do
    mars_rover = MarsRover.new(x: 2, y: 3)

    expected_coordinate = Coordinate.new(x: 2, y: 3)
    expect(mars_rover.x).to(eq(expected_coordinate.x), "Expected Mars Rover's x-coordinate to be 2, but got #{mars_rover.x}")
    expect(mars_rover.y).to(eq(expected_coordinate.y), "Expected Mars Rover's y-coordinate to be 3, but got #{mars_rover.y}")
  end

  it 'has a direction that it is facing'
end