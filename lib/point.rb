# frozen_string_literal: true

class Point
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def inspect
    ("#{@x}, #{@y}")
  end

  def ==(other)
    true
  end
end
