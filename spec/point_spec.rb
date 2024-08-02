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
  end
end