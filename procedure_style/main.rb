#!/usr/bin/env ruby

# frozen_string_literal: true

$stdout.puts 'Input (°C, °F or °K)'

regex = /(?<value>-?\d*[.|,]?\d*)\s*(?<sign>[a-z])\s*/i
input = $stdin.gets.chomp.downcase
parsed_input = input.match(regex) || $stdout.puts("Wrong input: `#{input}`") & exit
value = parsed_input&.send(:[], :value)&.gsub(',', '.')&.to_f
sign = parsed_input&.send(:[], :sign)&.downcase&.to_sym

case sign
when :c
  celsius = value

  kelvin = celsius + 273
  formatted_kelvin = (kelvin % 1).zero? ? kelvin.to_i : kelvin

  fahrenheit = (celsius * 9.0 / 5.0) + 32
  formatted_fahrenheit = (fahrenheit % 1).zero? ? fahrenheit.to_i : fahrenheit

  $stdout.puts "°F: #{formatted_fahrenheit}"
  $stdout.puts "°K: #{formatted_kelvin}"
when :f
  fahrenheit = value

  celsius = (fahrenheit - 32) * 5.0 / 9.0
  formatted_celsius = (celsius % 1).zero? ? celsius.to_i : celsius

  kelvin = celsius + 273
  formatted_kelvin = (kelvin % 1).zero? ? kelvin.to_i : kelvin

  $stdout.puts "°C: #{formatted_celsius}"
  $stdout.puts "°K: #{formatted_kelvin}"
when :k
  kelvin = value

  celsius = kelvin - 273
  formatted_celsius = (celsius % 1).zero? ? celsius.to_i : celsius

  fahrenheit = (celsius * 9.0 / 5.0) + 32
  formatted_fahrenheit = (fahrenheit % 1).zero? ? fahrenheit.to_i : fahrenheit

  $stdout.puts "°C: #{formatted_celsius}"
  $stdout.puts "°F: #{formatted_fahrenheit}"
else
  $stdout.puts "Wrong temperature sign: `#{sign}`"
end

$stdout.flush
