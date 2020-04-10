# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::Degree::Fahrenheit do
  subject(:degree) { described_class.new(value) }

  describe '#to_fahrenheit' do
    subject(:result) { degree.to_fahrenheit }

    let(:value) { rand(1..20) }

    it { is_expected.to eq(value) }
  end

  describe '#to_kelvin' do
    subject(:result) { degree.to_kelvin }

    context 'value is 0' do
      let(:value) { 0 }

      it { is_expected.to be_within(0.2).of(255.37) }
    end

    context 'value abowe 0' do
      let(:value) { 10 }

      it { is_expected.to be_within(0.2).of(260.928) }
    end

    context 'value below 0' do
      let(:value) { -10 }

      it { is_expected.to be_within(0.2).of(249.817) }
    end
  end

  describe '#to_celsius' do
    subject(:result) { degree.to_celsius }

    context 'value is 0' do
      let(:value) { 0 }

      it { is_expected.to be_within(0.2).of(-17.7778) }
    end

    context 'value abowe 0' do
      let(:value) { 10 }

      it { is_expected.to be_within(0.2).of(-12.2222) }
    end

    context 'value below 0' do
      let(:value) { -10 }

      it { is_expected.to be_within(0.2).of(-23.3333) }
    end
  end
end
