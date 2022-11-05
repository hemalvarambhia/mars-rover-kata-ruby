require_relative './turn_right'
class TurnLeft
  def invert
    TurnRight.new
  end

  def execute(location)
    location.turn_left
  end

  LEFT = {
    'N' => 'W',
    'E' => 'N',
    'S' => 'E',
    'W' => 'S'
  }.freeze
  private_constant :LEFT
end
