require 'spec_helper'

describe "Point" do
  it 'has an x-coordinate' do
    point = Point.new(x: 0, y: -1)

    expect(point.x).to eq(0)
    expect(point.y).to eq(-1)
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
  end
end