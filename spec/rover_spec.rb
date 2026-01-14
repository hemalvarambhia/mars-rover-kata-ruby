# frozen_string_literal: true

# Tests for Rover initialization and behavior

require 'spec_helper'
require_relative '../lib/coordinates'
require_relative '../lib/rover'

RSpec.describe Rover do
  describe 'initialization' do
    it 'creates a rover with position and direction' do
      rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

      expect(rover.x).to eq(0)
      expect(rover.y).to eq(0)
      expect(rover.direction).to eq(:north)
    end

    it 'accepts any valid starting position' do
      rover = Rover.new(coordinates: Coordinates.new(5, 3), direction: :east)

      expect(rover.x).to eq(5)
      expect(rover.y).to eq(3)
      expect(rover.direction).to eq(:east)
    end

    %i[north south east west].each do |dir|
      it "accepts #{dir} as a valid direction" do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: dir)
        expect(rover.direction).to eq(dir)
      end
    end

    it 'rejects invalid directions' do
      expect { Rover.new(coordinates: Coordinates.new(0, 0), direction: :northeast) }
        .to raise_error(ArgumentError, /invalid direction/i)
    end

    it 'rejects nil coordinates' do
      expect { Rover.new(coordinates: nil, direction: :north) }
        .to raise_error(ArgumentError, /coordinates cannot be nil/i)
    end
  end

  describe '#execute' do
    describe 'forward command' do
      it 'moves north when facing north' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        rover.execute('f')

        expect(rover.y).to eq(1)
        expect(rover.x).to eq(0)
      end

      it 'moves south when facing south' do
        rover = Rover.new(coordinates: Coordinates.new(0, 1), direction: :south)

        rover.execute('f')

        expect(rover.y).to eq(0)
        expect(rover.x).to eq(0)
      end

      it 'moves east when facing east' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :east)

        rover.execute('f')

        expect(rover.x).to eq(1)
        expect(rover.y).to eq(0)
      end

      it 'moves west when facing west' do
        rover = Rover.new(coordinates: Coordinates.new(1, 0), direction: :west)

        rover.execute('f')

        expect(rover.x).to eq(0)
        expect(rover.y).to eq(0)
      end
    end

    describe 'backward command' do
      it 'moves south when facing north' do
        rover = Rover.new(coordinates: Coordinates.new(0, 1), direction: :north)

        rover.execute('b')

        expect(rover.y).to eq(0)
        expect(rover.x).to eq(0)
      end

      it 'moves north when facing south' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :south)

        rover.execute('b')

        expect(rover.y).to eq(1)
        expect(rover.x).to eq(0)
      end

      it 'moves west when facing east' do
        rover = Rover.new(coordinates: Coordinates.new(1, 0), direction: :east)

        rover.execute('b')

        expect(rover.x).to eq(0)
        expect(rover.y).to eq(0)
      end

      it 'moves east when facing west' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :west)

        rover.execute('b')

        expect(rover.x).to eq(1)
        expect(rover.y).to eq(0)
      end
    end

    describe 'multiple commands' do
      it 'executes commands in sequence' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        rover.execute('ffb')

        expect(rover.y).to eq(1)
        expect(rover.x).to eq(0)
      end
    end

    describe 'empty commands' do
      it 'does nothing with empty string' do
        rover = Rover.new(coordinates: Coordinates.new(5, 5), direction: :north)

        rover.execute('')

        expect(rover.x).to eq(5)
        expect(rover.y).to eq(5)
      end
    end

    describe 'command validation' do
      it 'rejects invalid commands with helpful error' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        expect { rover.execute('x') }
          .to raise_error(ArgumentError, "Invalid command 'x'. Valid commands: f (forward), b (backward)")
      end

      it 'rejects invalid command in sequence before executing any' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        expect { rover.execute('fx') }.to raise_error(ArgumentError)
        expect(rover.y).to eq(0)
      end
    end
  end
end
