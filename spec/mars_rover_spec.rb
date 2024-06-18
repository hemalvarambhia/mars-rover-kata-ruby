describe 'Operating a Mars Rover' do
  class MarsRover
    def initialize(initial_position)

    end

    def current_position
      [0, 0]
    end
  end

  before do
    # before each
  end

  after do
    # after each test
  end

  example 'has an initial position' do
    initial_position = [0, 0]
    mars_rover = MarsRover.new(initial_position)

    expect(mars_rover.current_position).to eq([0, 0])
  end
  example 'has a direction it is facing'
end

describe 'Moving a Mars Rover' do
  example 'moves forward'
  example 'moves backwards'
  example 'moves forwards and then backwards'
end