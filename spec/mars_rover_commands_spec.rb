describe 'Moving a Mars Rover' do
  it 'receives an array of commands from Earth' do
    initial_position = [0, 0]
    mars_rover = MarsRover.new(initial_position, direction: 'N')
    expect(mars_rover).to respond_to(:execute).with(1)
  end

  it 'moves forwards when facing north' do
    initial_position = [0, 1]
    mars_rover = MarsRover.new(initial_position, direction: 'N')
    expect { mars_rover.execute(['f']) }.to change(mars_rover, :current_position).from([0, 1]).to([0, 2])
  end

  it 'moves forwards when facing north from y=2' do
    initial_position = [0, 2]
    mars_rover = MarsRover.new(initial_position, direction: 'N')
    expect { mars_rover.execute(['f']) }.to change(mars_rover, :current_position).from([0, 2]).to([0, 3])
  end

  it 'moves forwards when facing south from (-1, -1) to (-1, -2)' do
    initial_position = [-1, -1]
    mars_rover =  MarsRover.new(initial_position, direction: 'S')

    expect { mars_rover.execute(['f']) }.to change(mars_rover, :current_position).from([-1, -1]).to([-1, -2])
  end

  it 'does not change its position when there is an unsupported command' do
    initial_position = [3, -1]
    mars_rover =  MarsRover.new(initial_position, direction: 'N')
    # This tests both the exception raised and that the instance did not change.
    # TODO FIXME we need more validation tests.
    # For example, this tests a case where the input direction is the default,
    # and we need more than that.
    expect { mars_rover.execute(['q']) }.to raise_error(CannotCommandMarsRover)
    expect(mars_rover.current_position).to eq(initial_position)
    expect(mars_rover.direction).to eq('N')
  end

  it 'raises an error if the input is not an array' do
    initial_position = [3, -1]
    mars_rover =  MarsRover.new(initial_position, direction: 'N')
    # This tests both the exception raised and that the instance did not change.
    expect { mars_rover.execute('Hello World') }.to raise_error(CannotCommandMarsRover)
    expect(mars_rover.current_position).to eq(initial_position)
    expect(mars_rover.direction).to eq('N')
  end

  it 'raises an error if the input array is empty' do
    pending 'For Hemal'
    initial_position = [3, -1]
    mars_rover =  MarsRover.new(initial_position, direction: 'N')
    expect { mars_rover.execute([]) }.to raise_error(CannotCommandMarsRover)
  end

  it 'moves backwards when facing north' do
    initial_position = [0, 1]
    mars_rover = MarsRover.new(initial_position, direction: 'N')
    expect { mars_rover.execute(['b']) }.to change(mars_rover, :current_position).from([0, 1]).to([0, 0])
  end

  it 'moves backwards when facing east' do
    pending 'For Hemal'
    initial_position = [0, 1]
    mars_rover = MarsRover.new(initial_position, direction: 'E')
    expect { mars_rover.execute(['b']) }.to change(mars_rover, :current_position).from([0, 1]).to([-1, 1])
  end

  example 'moves forwards and then backwards'
end
