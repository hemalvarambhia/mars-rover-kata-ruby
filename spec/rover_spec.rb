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

  describe '#execute_commands' do
    describe 'forward command' do
      [
        { direction: :north, start: Coordinates.new(0, 0), expected: Coordinates.new(0, 1) },
        { direction: :south, start: Coordinates.new(0, 1), expected: Coordinates.new(0, 0) },
        { direction: :east,  start: Coordinates.new(0, 0), expected: Coordinates.new(1, 0) },
        { direction: :west,  start: Coordinates.new(1, 0), expected: Coordinates.new(0, 0) }
      ].each do |tc|
        it "moves when facing #{tc[:direction]}" do
          rover = Rover.new(coordinates: tc[:start], direction: tc[:direction])

          rover.execute_commands(['f'])

          expect(Coordinates.new(rover.x, rover.y)).to eq(tc[:expected])
        end
      end
    end

    describe 'backward command' do
      [
        { direction: :north, start: Coordinates.new(0, 1), expected: Coordinates.new(0, 0) },
        { direction: :south, start: Coordinates.new(0, 0), expected: Coordinates.new(0, 1) },
        { direction: :east,  start: Coordinates.new(1, 0), expected: Coordinates.new(0, 0) },
        { direction: :west,  start: Coordinates.new(0, 0), expected: Coordinates.new(1, 0) }
      ].each do |tc|
        it "moves when facing #{tc[:direction]}" do
          rover = Rover.new(coordinates: tc[:start], direction: tc[:direction])

          rover.execute_commands(['b'])

          expect(Coordinates.new(rover.x, rover.y)).to eq(tc[:expected])
        end
      end
    end

    describe 'multiple commands' do
      it 'executes commands in sequence' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        rover.execute_commands(%w[f f b])

        expect(rover.y).to eq(1)
        expect(rover.x).to eq(0)
      end
    end

    describe 'empty commands' do
      it 'does nothing with empty array' do
        rover = Rover.new(coordinates: Coordinates.new(5, 5), direction: :north)

        rover.execute_commands([])

        expect(rover.x).to eq(5)
        expect(rover.y).to eq(5)
      end
    end

    describe 'command validation' do
      it 'accepts all valid commands' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        expect { rover.execute_commands(%w[f b l r]) }.not_to raise_error
      end

      it 'rejects nil commands' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        expect { rover.execute_commands(nil) }
          .to raise_error(ArgumentError, /commands must be an array/i)
      end

      it 'rejects non-array commands' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        expect { rover.execute_commands('fblr') }
          .to raise_error(ArgumentError, /commands must be an array/i)
      end

      it 'rejects invalid commands with helpful error' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        expect { rover.execute_commands(['x']) }
          .to raise_error(ArgumentError, /Invalid command 'x'.*Valid commands:.*f.*b.*l.*r/)
      end

      it 'rejects invalid command in sequence before executing any' do
        rover = Rover.new(coordinates: Coordinates.new(0, 0), direction: :north)

        expect { rover.execute_commands(%w[f x]) }.to raise_error(ArgumentError)
        expect(rover.y).to eq(0)
      end
    end
  end
end
