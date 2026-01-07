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
end
