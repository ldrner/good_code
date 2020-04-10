# frozen_string_literal: true

require_relative '../lib/input_parser'
require_relative '../lib/degree'
require_relative '../lib/degree/celsius.rb'
require_relative '../lib/degree/fahrenheit.rb'
require_relative '../lib/degree/kelvin.rb'

RSpec.configure do |config|
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
