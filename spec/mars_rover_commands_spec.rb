describe 'Moving a Mars Rover' do
  it 'receives an array of commands from Earth' do
    mars_rover = MarsRover.new(Position.origin, orientation: :north)
    expect(mars_rover).to respond_to(:execute).with(1)
  end

  it 'moves forwards when facing north' do
    initial_position = Position.new(x: 0, y: 1)
    mars_rover = MarsRover.new(initial_position, orientation: :north)
    mars_rover.execute(['f'])
    expect(mars_rover.position.x).to eq(0)
    expect(mars_rover.position.y).to eq(2)
  end

  it 'moves forwards when facing north from y=2' do
    initial_position = Position.new(x: 0, y: 2)
    mars_rover = MarsRover.new(initial_position, orientation: :north)
    mars_rover.execute(['f'])
    expect(mars_rover.position.x).to eq(0)
    expect(mars_rover.position.y).to eq(3)
  end

  it 'moves forwards when facing south from (-1, -1) to (-1, -2)' do
    initial_position = Position.new(x: -1, y: -1)
    mars_rover = MarsRover.new(initial_position, orientation: :south)
    mars_rover.execute(['f'])
    expect(mars_rover.position.x).to eq(-1)
    expect(mars_rover.position.y).to eq(-2)
  end

  it 'does not change its position when there is an unsupported command' do
    initial_position = Position.new(x: 3, y: -1)
    mars_rover = MarsRover.new(initial_position, orientation: :north)
    # This tests both the exception raised and that the instance did not change.
    # TODO FIXME we need more validation tests.
    # For example, this tests a case where the input direction is the default,
    # and we need more than that.
    expect { mars_rover.execute(['q']) }.to raise_error(CannotCommandMarsRover)
    expect(mars_rover.position.x).to eq(3)
    expect(mars_rover.position.y).to eq(-1)
    expect(mars_rover.orientation).to eq(:north)
  end

  %i[north south east west].each do |cardinal_direction|
    it "does not change direction from #{cardinal_direction} when there is an unsupported command" do
      initial_position = Position.new(x: 3, y: -1)
      mars_rover = MarsRover.new(initial_position, orientation: cardinal_direction)

      expect { mars_rover.execute(['q']) }.to raise_error(CannotCommandMarsRover)
      expect(mars_rover.orientation).to eq(cardinal_direction)
    end
  end

  it 'raises an error if the commands from Earth are not an array' do
    initial_position = Position.new(x: 3, y: -1)
    mars_rover = MarsRover.new(initial_position, orientation: :north)
    # This tests both the exception raised and that the instance did not change.
    expect { mars_rover.execute('Hello World') }.to raise_error(CannotCommandMarsRover)
    expect(mars_rover.position.x).to eq(3)
    expect(mars_rover.position.y).to eq(-1)
    expect(mars_rover.orientation).to eq(:north)
  end

  it 'raises an error if no commands (an empty array) are sent from Earth' do
    mars_rover = MarsRover.new(orientation: :north)
    expect { mars_rover.execute([]) }.to raise_error(CannotCommandMarsRover)
  end

  RSpec::Matchers.define :have_moved do
    match do |mars_rover|
      case @direction
      when :forward
        case mars_rover.orientation
        when :north
          mars_rover.position.y == 1
        when :east
          mars_rover.position.x == 1
        when :south
          mars_rover.position.y == -1
        when :west
          mars_rover.position.x == -1
        end
      when :backward
        case mars_rover.orientation
        when :north
          mars_rover.position.y == -1
        when :east
          mars_rover.position.x == -1
        when :south
          mars_rover.position.y == 1
        when :west
          mars_rover.position.x == 1
        end
      end
    end

    chain :in_direction do |direction|
      @direction = direction
    end

    failure_message do |mars_rover|
      "expected the Mars rover to have moved #{@direction} from #{Position.origin} to #{Position.origin.translate(mars_rover.orientation)} but it moved to #{mars_rover.position}"
    end
  end

  %i[north south east west].each do |orientation|
    it "moves backwards when facing #{orientation}" do
      mars_rover = MarsRover.new(orientation:)
      mars_rover.execute(['b'])
      expect(mars_rover).to have_moved.in_direction(:backward)
    end
  end

  it 'turns left when facing north' do
    mars_rover = MarsRover.new(orientation: :north)
    mars_rover.execute(['l'])
    expect(mars_rover.orientation).to eq(:west)
  end

  it 'turns left when facing west' do
    mars_rover = MarsRover.new(orientation: :west)
    mars_rover.execute(['l'])
    expect(mars_rover.orientation).to eq(:south)
  end

  it 'turns left when facing south' do
    mars_rover = MarsRover.new(orientation: :south)
    mars_rover.execute(['l'])
    expect(mars_rover.orientation).to eq(:east)
  end

  it 'turns left when facing east' do
    mars_rover = MarsRover.new(orientation: :east)
    mars_rover.execute(['l'])
    expect(mars_rover.orientation).to eq(:north)
  end

  example 'raises error if commands to execute is not an array of valid characters' do
    # array should only consist of f, b, l, r
    skip('implement valid characters for commands')
  end

  example 'raises error if commands to execute is an empty array' do
    # Let the user know something went wrong if array of commands is empty.
    # It seems likely that this would be a mistake that should be caught.
    skip('implement valid array for commands')
  end

  example 'raises error if too many commands are sent' do
    # We should limit the number of commands that can be sent
    # And specify in the documentation what the limit is.
    # Otherwise a user could send an arbitrary number of commands
    # and possibly crash the system.
    skip('implement too many commands')
  end

  example 'TODO: implement wrapping at edges?' do
    # This requirement has not yet been met, and is not well defined.
    # What do they really want here?
    skip('implement wrapping?')
  end

  example 'TODO: implement obstacle detection?' do
    # This requirement has not yet been met, and is not well defined.
    # What do they really want here?
    skip('implement obstacle detection?')
  end
end
