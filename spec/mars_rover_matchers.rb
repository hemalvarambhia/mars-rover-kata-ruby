module MarsRoverMatchers
  RSpec::Matchers.define :be_located_at do |expected_position|
    match { |rover| rover.current_position == expected_position }
  end

  RSpec::Matchers.define :be_facing do |expected_direction|
    match { |rover| rover.direction == expected_direction}
  end
end
