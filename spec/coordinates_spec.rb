# frozen_string_literal: true

# Tests for Coordinates value object

require 'spec_helper'
require_relative '../lib/coordinates'

RSpec.describe Coordinates do
  describe 'initialization' do
    it 'creates coordinates with x and y' do
      coords = Coordinates.new(3, 5)

      expect(coords.x).to eq(3)
      expect(coords.y).to eq(5)
    end

    it 'is immutable' do
      coords = Coordinates.new(1, 2)

      expect(coords).not_to respond_to(:x=)
      expect(coords).not_to respond_to(:y=)
    end
  end

  describe '#translate' do
    it 'returns new Coordinates with offset applied' do
      coords = Coordinates.new(3, 5)

      result = coords.translate(1, 2)

      expect(result).to eq(Coordinates.new(4, 7))
    end

    it 'handles negative deltas' do
      coords = Coordinates.new(3, 5)

      result = coords.translate(-1, -2)

      expect(result).to eq(Coordinates.new(2, 3))
    end

    it 'does not modify original coordinates' do
      coords = Coordinates.new(3, 5)

      coords.translate(1, 2)

      expect(coords).to eq(Coordinates.new(3, 5))
    end
  end
end
