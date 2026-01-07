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
end
