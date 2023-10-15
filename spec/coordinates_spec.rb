require_relative '../lib/coordinates'
describe Coordinates do
  describe 'equals' do
    example 'two coordinates with different x-coordinates are unequal'
    example 'two coordinates with different y-coordinates are unequal'
    example 'two coordinates with the x and y-coordinates are equal'
    example 'a coordinate and an object of a different type are unequal'
  end
end