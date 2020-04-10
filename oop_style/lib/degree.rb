# frozen_string_literal: true

class Degree
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def name
    self.class::NAME
  end

  def normalize
    (value % 1).zero? ? value.to_i : value
  end

  def to_celsius
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def to_fahrenheit
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def to_kelvin
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
