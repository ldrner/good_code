# frozen_string_literal: true

class Degree::Fahrenheit < Degree
  NAME = '°F'

  def to_fahrenheit
    value
  end

  def to_celsius
    (value - 32) * 5.0 / 9.0
  end

  def to_kelvin
    to_celsius + 273
  end
end
