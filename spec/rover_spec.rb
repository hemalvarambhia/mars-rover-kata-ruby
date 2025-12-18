# Tests for Rover initialization and behavior

require 'spec_helper'

RSpec.describe Rover do
  describe 'initialization' do
    it 'creates a rover with position and direction' do
      rover = Rover.new(x: 0, y: 0, direction: :north)

      expect(rover.x).to eq(0)
      expect(rover.y).to eq(0)
      expect(rover.direction).to eq(:north)
    end

    it 'accepts any valid starting position' do
      rover = Rover.new(x: 5, y: 3, direction: :east)

      expect(rover.x).to eq(5)
      expect(rover.y).to eq(3)
      expect(rover.direction).to eq(:east)
    end

    %i[north south east west].each do |dir|
      it "accepts #{dir} as a valid direction" do
        rover = Rover.new(x: 0, y: 0, direction: dir)
        expect(rover.direction).to eq(dir)
      end
    end

    it 'rejects invalid directions' do
      expect { Rover.new(x: 0, y: 0, direction: :northeast) }
        .to raise_error(ArgumentError, /invalid direction/i)
    end
  end
end

