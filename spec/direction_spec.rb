# frozen_string_literal: true

# Tests for Direction class
require 'spec_helper'
require_relative '../lib/direction'

RSpec.describe Direction do
  describe '.valid?' do
    %i[north south east west].each do |dir|
      it "returns true for #{dir}" do
        expect(Direction.valid?(dir)).to be true
      end
    end

    it 'returns false for invalid directions' do
      expect(Direction.valid?(:northeast)).to be false
      expect(Direction.valid?(:up)).to be false
      expect(Direction.valid?(nil)).to be false
    end
  end

  describe '.delta_for' do
    it 'returns [0, 1] for north' do
      expect(Direction.delta_for(:north)).to eq([0, 1])
    end

    it 'returns [0, -1] for south' do
      expect(Direction.delta_for(:south)).to eq([0, -1])
    end

    it 'returns [1, 0] for east' do
      expect(Direction.delta_for(:east)).to eq([1, 0])
    end

    it 'returns [-1, 0] for west' do
      expect(Direction.delta_for(:west)).to eq([-1, 0])
    end

    it 'raises KeyError for invalid direction' do
      expect { Direction.delta_for(:invalid) }.to raise_error(KeyError)
    end
  end

  describe '.all' do
    it 'returns all valid directions' do
      expect(Direction.all).to contain_exactly(:north, :south, :east, :west)
    end
  end
end
