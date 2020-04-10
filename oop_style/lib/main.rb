#!/usr/bin/env ruby

# frozen_string_literal: true

class Main # :nodoc:
  AVAILABLE_DEGREES = %i[c]

  attr_reader :stdin, :stdout

  def initialize(stdin: $stdin, stdout: $stdout)
    @stdin = stdin
    @stdout = stdout
  end

  def call
    print_header

    parse_result = InputParser.parse(stdin)
    sign = validate_sign(parse_result.sign)

    celsius = Degree::Celsius.new(parse_result.value)
    kelvin = Degree::Kelvin.new(celsius.to_kelvin)
    fahrenheit = Degree::Fahrenheit.new(celsius.to_fahrenheit)

    print_degrees fahrenheit
    print_degrees kelvin
  rescue Errors::ParseError, Errors::ValidationError => e
    stdout.puts(e.message) & exit
  ensure
    stdout.flush
  end

  private

  def print_degrees(degree)
    stdout.puts "#{degree.name}: #{degree.normalize}"
  end

  def print_header
    stdout.puts 'Input (°C, °F or °K)'
  end

  def validate_sign(sign)
    return sign if AVAILABLE_DEGREES.include?(sign.to_sym)

    raise Errors::ValidationError, "Wrong temperature sign: `#{sign}`"
  end
end

# require objects
Dir.glob(File.join(File.dirname(__FILE__), '/**/*.rb')).sort.each { |file| require file }

Main.new.call
