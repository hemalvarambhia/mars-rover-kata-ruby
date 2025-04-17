# frozen_string_literal: true

# The Orientation class handles validation and provides access to valid cardinal directions
# that a Mars Rover can face. It ensures that orientations are restricted to the four
# cardinal directions: north, east, south, and west.
class Orientation
  # Returns array of valid cardinal directions that a Mars Rover can face
  # @return [Array<Symbol>] Array containing :north, :east, :south, :west
  # @example Get all valid orientations
  #   Orientation.all #=> [:north, :east, :south, :west]
  def self.all
    %i[north east south west]
  end

  # Checks if an orientation is valid
  # @param orientation [Symbol] The orientation to validate
  # @return [Boolean] true if orientation is one of :north, :east, :south, :west
  # @example Check if :north is valid
  #   Orientation.valid?(:north) #=> true
  # @example Check if :invalid is valid
  #   Orientation.valid?(:invalid) #=> false
  def self.valid?(orientation)
    all.include?(orientation)
  end

  # Checks if an orientation is invalid
  # @param orientation [Symbol] The orientation to validate
  # @return [Boolean] true if orientation is not one of :north, :east, :south, :west
  # @example Check if :north is invalid
  #   Orientation.invalid?(:north) #=> false
  # @example Check if :invalid is invalid
  #   Orientation.invalid?(:invalid) #=> true
  def self.invalid?(orientation)
    !valid?(orientation)
  end
end
