Position = Data.define(:x, :y) do
  def self.origin
    new(x: 0, y: 0)
  end

  def to_a
    [x, y]
  end

  def [](index)
    if index.zero?
      x
    elsif index == 1
      y
    else
      raise RuntimeError("No such index as #{index}")
    end
  end

  def move(orientation)
    case orientation.to_sym
    when :north
      with(y: y + 1)
    when :east
      with(x: x + 1)
    when :south
      with(y: y - 1)
    when :west
      with(x: x - 1)
    else
      raise "Invalid orientation: #{orientation}"
    end
  end

  def to_s
    "(#{x}, #{y})"
  end

  def self.from_array_or_position(position)
    if position.is_a?(Array)
      new(x: position[0], y: position[1])
    else
      position
    end
  end

  def invalid?
    to_a.length != 2 || !to_a.all? { |element| element.is_a?(Integer) }
  end
end
