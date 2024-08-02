require 'spec_helper'

describe "Point" do
  class Point
    attr_reader :x, :y

    def initialize(x:, y:)
      @x = x
      @y = y
    end
  end

  it 'has an x-coordinate' do
    point = Point.new(x: 0, y: -1)

    expect(point.x).to eq(0)
    expect(point.y).to eq(-1)
  end
end