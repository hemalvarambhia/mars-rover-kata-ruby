require_relative '../lib/coordinates'
describe Coordinates do
  describe 'equals' do
    example 'two coordinates with different x-coordinates but same y-coordinates are unequal' do
      coordinates = Coordinates.new(x: -1, y: 5)
      coordinates_with_different_x = Coordinates.new(x: 3, y: 5)

      expect(coordinates).not_to eq(coordinates_with_different_x)
    end

    example 'two coordinates with different y-coordinates but same x-coordinates are unequal' do
      coordinates = Coordinates.new(x: 4, y: -2)
      coordinates_with_different_y = Coordinates.new(x: 4, y: 7)

      expect(coordinates).not_to eq(coordinates_with_different_y)
    end

    example 'two coordinates with the x and y-coordinates are equal' do
      coordinates = Coordinates.new(x: -1, y: -2)
      equal_coordinates = Coordinates.new(x: -1, y: -2)

      expect(coordinates).to eq(equal_coordinates)
    end
    example 'a coordinate and an object of a different type are unequal'
  end
end