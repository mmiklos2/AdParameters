# frozen_string_literal: true

require 'bigdecimal'
require 'spec_helper'
require_relative '../../lib/entities/creative'

RSpec.describe Creative do
  subject { described_class.new(id: 'video-1', price: BigDecimal('6.4567'), currency: 'EUR') }

  describe '#price_in_euros' do
    it 'returns the price in euros' do
      expect(subject.price_in_euros).to eq(Money.new(646, 'EUR'))
    end

    context 'when the currency is USD' do
      subject { described_class.new(id: 'video-1', price: BigDecimal('6.4567'), currency: 'USD') }

      it 'returns the price in euros' do
        expect(subject.price_in_euros).to eq(Money.new(572, 'EUR'))
      end
    end
  end
end
