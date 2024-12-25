require 'spec_helper'
describe 'Turning left' do
  it 'turns left when facing north, meaning it now faces west' do
    mars_rover = MarsRover.new([0, 0], direction: :north)

    expect { mars_rover.execute(['l']) }.to change(mars_rover, :direction).to :west
  end
  it 'turns left when facing west, meaning it now faces south'
  it 'turns left when facing south, meaning it now faces east'
  it 'turns left when facing east, meaning it now faces north'
end
