class MarsRover

  def initialize(starting_location:, map:, obstacle_detector:)
    @current_location = starting_location
    @map = map
    @obstacle_detector = obstacle_detector
  end

  def execute(commands_from_earth)
    commands = {
      'f' => ->(location) { send(:forwards, location) },
      'b' => ->(location) { send(:backwards, location) },
      'l' => ->(location) { send(:rotate_left, location) },
      'r' => ->(location) { send(:rotate_right, location) }
    }
    @current_location =
      commands_from_earth.inject(@current_location) do |location, command|
        case command
        when 'f'
          commands['f'].call(location)
        when 'b'
          commands['b'].call(location)
        when 'l'
          commands['l'].call(location)
        when 'r'
          commands[command].call(location)
        else
          location
        end
    end
  end

  def obstacle_encountered
    @obstacle_coordinates
  end

  def current_position
    @current_location.coordinates
  end

  def direction
    @current_location.direction
  end

  def inspect
    "a Mars Rover at #{@current_location.inspect}"
  end

  def to_s
    "a Mars Rover #{@current_location}"
  end

  private

  def forwards(location)
    next_location = @map.forwards(location)
    if obstacle_at?(next_location)
      @obstacle_coordinates = next_location.coordinates
      location
    else
      next_location
    end
  end

  def backwards(location)
    next_location = @map.backwards(location)
    if obstacle_at?(next_location)
      @obstacle_coordinates = next_location.coordinates
      location
    else
      next_location
    end
  end

  def rotate_left(location)
    @map.rotate_left(location)
  end

  def rotate_right(location)
    @map.rotate_right(location)
  end

  def obstacle_at?(location)
    @obstacle_detector.obstacle_at?(location.coordinates)
  end
end
