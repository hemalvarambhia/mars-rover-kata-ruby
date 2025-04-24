# frozen_string_literal: true

class TooManyCommands < StandardError
  def initialize(message = 'Too many commands')
    super
  end

  def to_formatted_h
    {}
  end
end
