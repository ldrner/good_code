# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Degree::Celsius do
  subject(:degree) { described_class.new(value) }

  describe '#to_fahrenheit' do
    subject(:result) { degree.to_fahrenheit }

    context 'value is 0' do
      let(:value) { 0 }

      it { is_expected.to eq(32.0) }
    end

    context 'value abowe 0' do
      let(:value) { 10 }

      it { is_expected.to eq(50.0) }
    end

    context 'value below 0' do
      let(:value) { -10 }

      it { is_expected.to eq(14.0) }
    end
  end

  describe '#to_kelvin' do
    subject(:result) { degree.to_kelvin }

    context 'value is 0' do
      let(:value) { 0 }

      it { is_expected.to eq(273) }
    end

    context 'value abowe 0' do
      let(:value) { 10 }

      it { is_expected.to eq(283) }
    end

    context 'value below 0' do
      let(:value) { -10 }

      it { is_expected.to eq(263) }
    end
  end

  describe '#to_celsius' do
    subject(:result) { degree.to_celsius }

    let(:value) { rand(1..20) }

    it { is_expected.to eq(value) }
  end
end
