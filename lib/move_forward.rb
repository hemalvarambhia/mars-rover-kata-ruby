require_relative './move_backward'
class MoveForward
  def invert
    MoveBackward.new
  end

  def execute(location)
    location.move_forward
  end
end
