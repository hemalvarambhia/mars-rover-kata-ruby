class TurnRight
  def execute(location)
    location.turn_right
  end

  RIGHT = {
    'W' => 'N',
    'N' => 'E',
    'E' => 'S',
    'S' => 'W'
  }.freeze
  private_constant :RIGHT
end
