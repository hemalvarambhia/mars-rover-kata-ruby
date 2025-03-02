require 'spec_helper'
describe 'Moving a Mars Rover' do
  describe 'Moving forwards' do
    it 'moves forwards when facing north' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: 0, y: 1), direction: :north)

      expect { mars_rover.execute(['f']) }.to(
        move(mars_rover, displacement: Displacement.new(dx: 0, dy: 1))
      )
    end

    it 'moves forwards from any position when facing north' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: 0, y: 2), direction: :north)

      expect { mars_rover.execute(['f']) }.to(
        move(mars_rover, displacement: Displacement.new(dx: 0, dy: 1))
      )
    end

    it 'moves forwards from any position when facing south' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: -1, y: -1), direction: :south)

      expect { mars_rover.execute(['f']) }.to(
        move(mars_rover, displacement: Displacement.new(dx: 0, dy: -1))
      )
    end

    it 'moves forwards when facing east' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: 0, y: 0), direction: :east)

      expect { mars_rover.execute(['f']) }.to(
        move(mars_rover, displacement: Displacement.new(dx: 1, dy: 0))
      )
    end

    it 'moves forwards when facing west' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: 0, y: 1), direction: :west)

      expect { mars_rover.execute(['f']) }.to(
        move(mars_rover, displacement: Displacement.new(dx: -1, dy: 0))
      )
    end

    it 'moves forwards multiple times' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: 2, y: 1), direction: :south)

      expect { mars_rover.execute(%w[f f f]) }.to(
        move(mars_rover, displacement: Displacement.new(dx: 0, dy: -3))
      )
    end
  end

  describe 'Moving backwards' do
    it 'moves backwards when facing north' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: 0, y: 1), direction: :north)

      expect { mars_rover.execute(['b']) }.to(
        move(mars_rover, displacement: Displacement.new(dx: 0, dy: -1))
      )
    end

    it 'moves backwards from any position when facing north' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: 2, y: 1), direction: :north)

      expect { mars_rover.execute(['b']) }.to(
        move(mars_rover, displacement: Displacement.new(dx: 0, dy: -1))
      )
    end

    it 'moves backwards when facing east' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: 0, y: 1), direction: :east)

      expect { mars_rover.execute(['b']) }.to move(mars_rover, displacement: Displacement.new(dx: -1, dy: 0))
    end

    it 'moves backwards from any position when facing east' do
      mars_rover = MarsRover.new(starting_point: Point.new(x: -1, y: 1), direction: :east)

      expect { mars_rover.execute(['b']) }.to move(mars_rover, displacement: Displacement.new(dx: -1, dy: 0))
    end

    it 'moves backwards when facing south' do
      mars_rover = MarsRover.new([-1, -1], direction: :south)

      expect { mars_rover.execute(['b']) }.to(move(mars_rover, displacement: Displacement.new(dx: 0, dy: 1)))
    end

    it 'moves backwards when facing west' do
      mars_rover = MarsRover.new([3, 1], direction: :west)

      expect { mars_rover.execute(['b']) }.to move(mars_rover, displacement: Displacement.new(dx: 1, dy: 0))
    end
  end

  example 'moves forwards and then backwards' do
    mars_rover = MarsRover.new(starting_point: Point.new(x: 0, y: 1), direction: :east)

    expect { mars_rover.execute(%w[f b b b]) }.to move(mars_rover, displacement: Displacement.new(dx: -2, dy: 0))
  end

  private

  def move(mars_rover, displacement:)
    change(mars_rover, :y_coordinate).by(displacement.dy).and change(mars_rover, :x_coordinate).by(displacement.dx)
  end
end