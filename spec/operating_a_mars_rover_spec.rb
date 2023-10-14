RSpec.describe 'Operating a Mars rover' do
  class MarsRover
    def initialize(x: 0, y: 0)
      @x = 0
      @y = 0
    end

    def x
      @x
    end

    def y
      @y
    end
  end

  it 'has a starting position at the origin' do
    mars_rover = MarsRover.new(x: 0, y: 0)

    expect(mars_rover.x).to eq(0)
    expect(mars_rover.y).to eq(0)
  end
  it 'has a direction that it is facing'
end