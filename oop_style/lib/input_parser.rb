# frozen_string_literal: true

require 'errors'

class InputParser
  ParsedResult = Struct.new(:value, :sign)

  TEST_REGEXP = /
    (?<value>-?\d*[.|,]?\d*) # any number with delimeter 11.22 or 11,22
    \s*                      # zero or more whitespace
    (?<sign>[a-z])           # any single character in the range a-z
    \s*                      # zero or more whitespace
  /ix

  def self.parse(stdin)
    input = stdin.gets&.chomp&.downcase
    parsed_input = input.match(TEST_REGEXP) if input
    raise Errors::ParseError, "Wrong input: `#{input}`" unless parsed_input

    value = parsed_input[:value]&.gsub(',', '.')&.to_f
    sign = parsed_input[:sign]&.downcase&.to_sym

    ParsedResult.new(value, sign)
  end
end
