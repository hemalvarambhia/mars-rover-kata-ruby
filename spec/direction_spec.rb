# frozen_string_literal: true

# Tests for Direction class
require 'spec_helper'
require_relative '../lib/direction'

RSpec.describe Direction do
  describe 'delta' do
    it 'returns [0, 1] for NORTH' do
      expect(Direction::NORTH.delta).to eq([0, 1])
    end

    it 'returns [0, -1] for SOUTH' do
      expect(Direction::SOUTH.delta).to eq([0, -1])
    end

    it 'returns [1, 0] for EAST' do
      expect(Direction::EAST.delta).to eq([1, 0])
    end

    it 'returns [-1, 0] for WEST' do
      expect(Direction::WEST.delta).to eq([-1, 0])
    end
  end

  describe '.all' do
    it 'returns all direction instances' do
      expect(Direction.all).to contain_exactly(
        Direction::NORTH,
        Direction::SOUTH,
        Direction::EAST,
        Direction::WEST
      )
    end
  end

  describe 'private constructor' do
    it 'prevents creating arbitrary instances' do
      expect { Direction.new([0, 0]) }.to raise_error(NoMethodError)
    end
  end
end
