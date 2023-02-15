require 'minitest/autorun'
require 'ostruct'
require_relative '../../lib/vehicle_controller'
class SphericalPlanet
  def next_location_to(location, orientation)
    PolarCoordinates.new(latitude: location.latitude + 1, longitude: location.longitude)
  end
end
class PolarCoordinates
  attr_reader :longitude, :latitude
  def initialize(latitude:, longitude:)
    @latitude = latitude
    @longitude = longitude
  end
end
class MovingANorthFacingVehicleOnASphericalPlanetTest < Minitest::Test
  def test_moving_forward_when_facing_north_far_from_north_pole
    spherical_planet = SphericalPlanet.new
    starting_position = PolarCoordinates.new(latitude: 1, longitude: 1)
    mars_rover =
      VehicleController.new(
        vehicle: MarsRover.new(planet: spherical_planet, starting_position: starting_position, orientation: 'N')
      )

    mars_rover.execute('f')

    assert_equal(2, mars_rover.current_position.latitude)
    assert_equal(1, mars_rover.current_position.longitude)
    assert_equal('N', mars_rover.orientation)
  end

  def test_moving_forwards_from_any_point_far_from_north_pole
    spherical_planet = SphericalPlanet.new
    starting_position = PolarCoordinates.new(latitude: 1, longitude: 2)
    mars_rover =
      VehicleController.new(
        vehicle: MarsRover.new(planet: spherical_planet, starting_position: starting_position, orientation: 'N')
      )

    mars_rover.execute('f')

    assert_equal(2, mars_rover.current_position.latitude, 'latitude')
    assert_equal(2, mars_rover.current_position.longitude, 'longitude')
    assert_equal('N', mars_rover.orientation)
  end

  def test_moving_forwards_to_the_north_pole
    skip('Test list')
  end

  def test_moving_two_steps_forward_far_from_north_pole
    skip('Test list')
  end
end
