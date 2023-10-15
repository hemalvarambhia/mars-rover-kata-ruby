require_relative '../lib/coordinates'
describe Coordinates do
  describe 'equals' do
    example 'two coordinates with different x-coordinates but same y-coordinates are unequal'
    example 'two coordinates with different y-coordinates but same x-coordinates are unequal'
    example 'two coordinates with the x and y-coordinates are equal' do
      coordinates = Coordinates.new(x: -1, y: -2)
      equal_coordinates = Coordinates.new(x: -1, y: -2)
      expect(coordinates).to eq(equal_coordinates)
    end
    example 'a coordinate and an object of a different type are unequal'
  end
end