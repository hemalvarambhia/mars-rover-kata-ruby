require 'spec_helper'
describe 'Turning left' do
  it 'turns left when facing north, meaning it now faces west' do
    mars_rover = mars_rover_facing(direction: :north)

    expect { mars_rover.execute(['l']) }.to change(mars_rover, :direction).to :west
  end
  it 'turns left when facing west, meaning it now faces south' do
    mars_rover = mars_rover_facing(direction: :west)

    expect { mars_rover.execute(['l']) }.to change(mars_rover, :direction).to(:south)
  end
  it 'turns left when facing south, meaning it now faces east' do
    mars_rover = mars_rover_facing(direction: :south)

    expect { mars_rover.execute(['l']) }.to change(mars_rover, :direction).to(:east)
  end
  it 'turns left when facing east, meaning it now faces north' do
    mars_rover = mars_rover_facing(direction: :east)

    expect { mars_rover.execute(['l']) }.to change(mars_rover, :direction).to(:north)
  end

  private

  def mars_rover_facing(direction:)
    MarsRover.new(starting_point: Point.new(x: 0, y: 0), direction:)
  end
end
