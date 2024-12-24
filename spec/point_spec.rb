require 'spec_helper'
require 'ostruct'
require_relative '../lib/displacement'
describe "Point" do
  it 'has an x-coordinate' do
    point = Point.new(x: 0, y: -1)

    expect(point.x).to eq(0)
    expect(point.y).to eq(-1)
  end

  describe 'translating a point' do
    it 'translates a point along the x-axis' do
      starting_point = Point.new(x: 0, y: 1)

      displacement = Displacement.new(dx: 1, dy: 0)
      translated_point = starting_point.move(displacement)

      expected = Point.new(x: 1, y: 1)
      expect(translated_point).to eq(expected)
    end

    it 'translates any point along the x-axis' do
      starting_point = Point.new(x: 2, y: 1)

      displacement = Displacement.new(dx: 1, dy: 0)
      translated_point = starting_point.move(displacement)

      expected = Point.new(x: 3, y: 1)
      expect(translated_point).to eq(expected)
    end

    it 'translates any point along the y-axis' do
      starting_point = Point.new(x: 4, y: 1)
      displacement = Displacement.new(dx: 0, dy: 2)
      translated_point = starting_point.move(displacement)

      expected = Point.new(x: 4, y: 3)
      expect(translated_point).to eq(expected)
    end
  end

  describe '#=' do
    it 'points with same x and y coordinates are equal' do
      point1 = Point.new(x: 0, y: 0)
      point2 = Point.new(x: 0, y: 0)

      expect(point1).to eq(point2)
      expect(point2).to eq(point1)
    end
    it 'points with different y coordinates are not equal' do
      point1 = Point.new(x: 0, y: 1)
      point2 = Point.new(x: 0, y: 0)

      expect(point1).not_to eq(point2)
      expect(point2).not_to eq(point1)
    end

    it 'points with different x coordinates are not equal' do
      point1 = Point.new(x: 1, y: 0)
      point2 = Point.new(x: 0, y: 0)

      expect(point1).not_to eq(point2)
      expect(point2).not_to eq(point1)
    end

    it 'Points are not equal to strings' do
      point1 = Point.new(x: 1, y: 0)
      marya = 'Marya'
      expect(point1).not_to eq(marya)
      expect(marya).not_to eq(point1)
    end

    it 'Points are not equal to OpenStruct even if they have same methods' do
      point = Point.new(x: 1, y: 0)
      ostruct = OpenStruct.new(x: 1, y: 0)
      expect(point).not_to eq(ostruct)
      expect(ostruct).not_to eq(point)
    end

    it 'Points are not equal to null' do
      point = Point.new(x: 1, y: 0)
      expect(point).not_to eq(nil)
      expect(nil).not_to eq(point)
    end
  end
end