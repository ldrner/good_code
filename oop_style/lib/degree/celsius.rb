# frozen_string_literal: true

class Degree::Celsius < Degree
  NAME = '°C'

  def to_celsius
    value
  end

  def to_fahrenheit
    value * 9.0 / 5.0 + 32
  end

  def to_kelvin
    value + 273
  end
end
