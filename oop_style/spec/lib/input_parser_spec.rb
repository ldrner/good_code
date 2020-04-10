
# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::InputParser do
  subject(:parser) { described_class }

  describe '#parse' do
    subject(:result) { described_class.parse(stdin) }
    let(:stdin) { StringIO.new(input) }

    context 'with empty input' do
      let(:value) { '' }
      let(:sign) { '' }
      let(:input) { "#{value}#{sign}" }

      it 'raises error' do
        expect { described_class.parse(stdin) }.to raise_error(Errors::ParseError, /Wrong input/)
      end
    end

    context 'without sign letter' do
      let(:value) { '10' }
      let(:sign) { '' }
      let(:input) { "#{value}#{sign}" }

      it 'raises error' do
        expect { described_class.parse(stdin) }.to raise_error(Errors::ParseError, /Wrong input/)
      end
    end

    context 'without value' do
      let(:value) { '' }
      let(:sign) { 'c' }
      let(:input) { "#{value}#{sign}" }

      it 'raises error' do
        expect { described_class.parse(stdin) }.to raise_error(Errors::ParseError, /Wrong input/)
      end
    end

    context 'with proper input' do
      let(:value) { '10' }
      let(:sign) { 'c' }
      let(:input) { "#{value}#{sign}" }

      it { is_expected.to contain_exactly(value.to_f, sign.to_sym) }
    end

    context 'input with delimited value' do
      let(:delimeter) { ['.', ','].sample }
      let(:value) { "10#{delimeter}10" }
      let(:sign) { 'c' }
      let(:expected_value) { 10.10 }
      let(:input) { "#{value}#{sign}" }

      it { is_expected.to contain_exactly(expected_value, sign.to_sym) }
    end

    context 'input with spaces' do
      let(:value) { '10' }
      let(:sign) { 'c' }
      let(:spacer) { ' ' * rand(1..10) }
      let(:input) { "#{spacer}#{value}#{spacer}#{sign}#{spacer}" }

      it { is_expected.to contain_exactly(value.to_f, sign.to_sym) }
    end
  end
end
