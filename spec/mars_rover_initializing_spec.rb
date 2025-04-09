require 'spec_helper'

describe 'Initializing a Mars Rover' do
  example 'defaults to the origin position' do
    mars_rover = MarsRover.new(orientation: :north)
    expect(mars_rover.position).to eq(Position.origin)
  end

  example 'has an initial position anywhere on the planet' do
    initial_position = [1, 1]
    mars_rover = MarsRover.new(initial_position, orientation: :north)
    expect(mars_rover.position).to eq(Position.new(x: 1, y: 1))
  end

  %i[north south east west].each do |orientation|
    it 'has an initial direction it is facing' do
      irrelevant = [0, -1]
      mars_rover = MarsRover.new(irrelevant, orientation:)

      expect(mars_rover.orientation).to eq(orientation)
    end
  end

  example 'cannot face X' do
    irrelevant = [0, -1]
    expect { MarsRover.new(irrelevant, orientation: 'X') }.to raise_error(CannotInitializeMarsRover)
  end

  example 'cannot face anywhere outside N, E, S or W' do
    irrelevant = [0, -1]
    expect { MarsRover.new(irrelevant, orientation: :something) }.to raise_error(CannotInitializeMarsRover)
  end

  example 'raises error if initial x position is not integer and initial y position is an integer' do
    skip('implement validation for initial x position is not integer')
  end

  example 'raises error if initial y position is not integer and initial x position is an integer' do
    skip('implement validation for initial y position is not integer')
  end

  example 'raises error if initial y position is "too large" by some definition not specified' do
    # after all, no planet has infinite x, y positions...
    # Unfortunately, we do not have a spec for this.
    # We need more info from the NASA project manager.
    skip('implement validation for initial y position too large')
  end

  example 'raises error if initial y position is "too large in the negative direction" by some definition not specified' do
    skip('implement validation for initial y position too large and negative')
  end

  example 'raises error if initial x position is "too large" by some definition not specified' do
    skip('implement validation for initial x position too large')
  end

  example 'raises error if initial x position is "too large in the negative direction" by some definition not specified' do
    skip('implement validation for initial x position too large and negative')
  end

  example 'raises error if initial position is not an array with 2 integer elements' do
    # TODO: FIXME. Starting to wonder if we should refactor our 2-int "position" array into something more human friendly
    # before continuing
    skip('implement validation for initial position')
  end

  example 'raises error if initial direction is not a string' do
    skip('implement validation for initial direction')
  end

  example 'question: should the mars rover raise an error when initialized incompletely' do
    # Do we really want to allow a default direction 'N'?
    # Inexperienced users may initialize the rover incorrectly, not realizing it was
    # pointing north, and go off in a wrong direction. Could be an expensive mistake!
    skip('requirements discussion for initializing')
  end

  example 'question: can x and y be negative, in fact?' do
    # I'd been assuming x and y can go negative, but that requirement
    # for wrapping makes me think not.
    skip('requirements discussion for negative x and y values')
  end
end
