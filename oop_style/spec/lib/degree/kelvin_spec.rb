# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Degree::Kelvin do
  subject(:degree) { described_class.new(value) }

  describe '#to_fahrenheit' do
    subject(:result) { degree.to_fahrenheit }

    context 'value is 0' do
      let(:value) { 0 }

      it { is_expected.to eq(-459.4) }
    end

    context 'value abowe 0' do
      let(:value) { 10 }

      it { is_expected.to eq(-441.4) }
    end

    context 'value below is 0' do
      let(:value) { -10 }

      it { is_expected.to eq(-477.4) }
    end
  end

  describe '#to_kelvin' do
    subject(:result) { degree.to_kelvin }

    let(:value) { rand(1..20) }

    it { is_expected.to eq(value) }
  end

  describe '#to_celsius' do
    subject(:result) { degree.to_celsius }

    context 'value is 0' do
      let(:value) { 0 }

      it { is_expected.to eq(-273) }
    end

    context 'value abowe 0' do
      let(:value) { 10 }

      it { is_expected.to eq(-263) }
    end

    context 'value below is 0' do
      let(:value) { -10 }

      it { is_expected.to eq(-283) }
    end
  end
end
