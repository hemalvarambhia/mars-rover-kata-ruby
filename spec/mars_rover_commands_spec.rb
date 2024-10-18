require 'ostruct'
describe 'Moving a Mars Rover' do
  it 'receives an array of commands from Earth' do
    initial_position = [0, 0]
    mars_rover = MarsRover.new(initial_position, direction: :north)
    expect(mars_rover).to respond_to(:execute).with(1)
  end

  it 'moves forwards when facing north' do
    initial_position = [0, 1]
    mars_rover = MarsRover.new(initial_position, direction: :north)

    expect { mars_rover.execute(['f']) }.to change(mars_rover, :y_coordinate).by(1)
    expect { mars_rover.execute(['f']) }.not_to change(mars_rover, :x_coordinate)
  end

  it 'moves forwards when facing north from y=2' do
    initial_position = [0, 2]
    mars_rover = MarsRover.new(initial_position, direction: :north)

    expect { mars_rover.execute(['f']) }.to change(mars_rover, :y_coordinate).by 1
    expect { mars_rover.execute(['f']) }.not_to change(mars_rover, :x_coordinate)
  end

  it 'moves forwards when facing south from (-1, -1) to (-1, -2)' do
    initial_position = [-1, -1]
    mars_rover =  MarsRover.new(initial_position, direction: :south)

    expect { mars_rover.execute(['f']) }.to change(mars_rover, :y_coordinate).by -1
    expect { mars_rover.execute(['f']) }.not_to change(mars_rover, :x_coordinate)
  end

  it 'does not change its position when there is an unsupported command' do
    initial_position = [3, -1]
    mars_rover =  MarsRover.new(initial_position, direction: :north)
    # This tests both the exception raised and that the instance did not change.
    # TODO FIXME we need more validation tests.
    # For example, this tests a case where the input direction is the default,
    # and we need more than that.
    expect { mars_rover.execute(['q']) }.to raise_error(CannotCommandMarsRover)
    expect { execute_invalid_command(command: 'q', mars_rover: mars_rover) }.not_to change(mars_rover, :current_position)
    expect { execute_invalid_command(command: 'q', mars_rover: mars_rover) }.not_to change(mars_rover, :direction)
  end

  [:north, :south, :east, :west].each do |cardinal_direction|
    it "does not change direction from #{cardinal_direction} when there is an unsupported command" do
      initial_position = [3, -1]
      mars_rover =  MarsRover.new(initial_position, direction: cardinal_direction)

      expect { execute_invalid_command(command: 'q', mars_rover: mars_rover) }.not_to change(mars_rover, :direction)
    end
  end

  it 'raises an error if the commands from Earth are not an array' do
    initial_position = [3, -1]
    mars_rover =  MarsRover.new(initial_position, direction: :north)
    # This tests both the exception raised and that the instance did not change.
    expect { mars_rover.execute('Hello World') }.to raise_error(CannotCommandMarsRover)
    expect(mars_rover.current_position).to eq(initial_position)
    expect(mars_rover.direction).to eq(:north)
  end

  it 'raises an error if no commands (an empty array) are sent from Earth' do
    initial_position = [3, -1]
    mars_rover =  MarsRover.new(initial_position, direction: :north)
    expect { mars_rover.execute([]) }.to raise_error(CannotCommandMarsRover)
  end

  it 'moves backwards when facing north' do
    initial_position = [0, 1]
    mars_rover = MarsRover.new(initial_position, direction: :north)

    expect(-> { mars_rover.execute(['b']) }).to change(mars_rover, :y_coordinate).by -1
    expect(-> { mars_rover.execute(['b']) }).not_to change(mars_rover, :x_coordinate)
  end

  it 'moves backwards when facing east' do
    initial_position = [0, 1]
    mars_rover = MarsRover.new(initial_position, direction: :east)

    expect { mars_rover.execute(['b']) }.to change(mars_rover, :x_coordinate).by -1
  end

  example 'moves forwards and then backwards' do
    skip('implement test for moves forwards and then backwards')
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


  private

  def execute_invalid_command(command:, mars_rover:)
    begin
      mars_rover.execute([command])
    rescue
      # No op
    end
  end
end
