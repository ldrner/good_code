# frozen_string_literal: true

class Degree::Kelvin < Degree
  NAME = '°K'

  def to_celsius
    value - 273
  end

  def to_fahrenheit
    (to_celsius * 9.0 / 5.0) + 32
  end

  def to_kelvin
    value
  end
end
