require 'spec_helper'

describe "Point" do
  it 'has an x-coordinate' do
    point = Point.new(x: 0, y: -1)

    expect(point.x).to eq(0)
    expect(point.y).to eq(-1)
  end
end