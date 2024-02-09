# frozen_string_literal: true

require 'bigdecimal'
require 'spec_helper'
require_relative '../../lib/entities/placement'

RSpec.describe Placement do
  subject { described_class.new(id: 'video-1', floor: BigDecimal('6.4567'), currency: 'EUR') }

  describe '#floor_in_euros' do
    it 'returns the floor in euros' do
      expect(subject.floor_in_euros).to eq(Money.new(646, 'EUR'))
    end

    context 'when the currency is TYR' do
      subject { described_class.new(id: 'video-1', floor: BigDecimal('8.343'), currency: 'TYR') }

      it 'returns the floor in euros' do
        expect(subject.floor_in_euros).to eq(Money.new(252, 'EUR'))
      end
    end
  end
end
