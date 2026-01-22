# frozen_string_literal: true

# RSpec configuration for Mars Rover tests

require_relative '../lib/coordinates'

RSpec::Matchers.define :be_located_at do |expected_coords|
  match do |rover|
    Coordinates.new(rover.x, rover.y) == expected_coords
  end

  failure_message do |rover|
    actual = Coordinates.new(rover.x, rover.y)
    "expected rover at #{expected_coords}, got #{actual}"
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
