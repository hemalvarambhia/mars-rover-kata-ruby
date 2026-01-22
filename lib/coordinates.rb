# frozen_string_literal: true

# Value object representing x,y position on Mars grid
Coordinates = Data.define(:x, :y) do
  def translate(delta_x, delta_y)
    Coordinates.new(x + delta_x, y + delta_y)
  end
end
