
# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::InputParser do
  subject(:parser) { described_class }

  describe '#parse' do
    subject(:result) { described_class.parse(input) }

    context 'with proper input' do
      let(:value) { '10' }
      let(:sign) { 'c' }
      let(:input) { StringIO.new("#{value}#{sign}") }

      it { is_expected.to contain_exactly(value.to_f, sign.to_sym) }
    end

    context 'with empty input' do
      let(:value) { '' }
      let(:sign) { '' }
      let(:input) { StringIO.new("#{value}#{sign}") }

      it 'raises error' do
        expect { described_class.parse(input) }.to raise_error(Errors::ParseError, /Wrong input/)
      end
    end

    context 'input with delimited value' do
      let(:delimeter) { ['.', ','].sample }
      let(:input_value) { "10#{delimeter}10" }
      let(:sign) { 'c' }
      let(:expected_value) { 10.10 }
      let(:input) { StringIO.new("#{input_value}#{sign}") }

      it { is_expected.to contain_exactly(expected_value, sign.to_sym) }
    end

    context 'input with spaces' do
      let(:value) { '10' }
      let(:sign) { 'c' }
      let(:spacer) { ' ' * rand(1..10) }
      let(:input) { StringIO.new("#{spacer}#{value}#{spacer}#{sign}#{spacer}") }

      it { is_expected.to contain_exactly(value.to_f, sign.to_sym) }
    end

    context 'without sign letter' do
      let(:value) { '10' }
      let(:sign) { '' }
      let(:input) { StringIO.new("#{value}#{sign}") }

      it 'raises error' do
        expect { described_class.parse(input) }.to raise_error(Errors::ParseError, /Wrong input/)
      end
    end

    context 'without value' do
      let(:value) { '' }
      let(:expected_value) { 0.0 }
      let(:sign) { 'c' }
      let(:input) { StringIO.new("#{value}#{sign}") }

      it { is_expected.to contain_exactly(expected_value, sign.to_sym) }
    end
  end
end
