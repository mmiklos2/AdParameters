# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/services/creatives_to_placement_matcher'
require_relative '../../lib/entities/creative'
require_relative '../../lib/entities/placement'

RSpec.describe CreativesToPlacementMatcher do
  subject { described_class.new(creatives:, placement:).call }

  let(:creatives) { [creative1, creative2, creative3] }
  let(:creative1) { Creative.new(id: 'video-1', price: BigDecimal('7'), currency: 'EUR') }
  let(:creative2) { Creative.new(id: 'video-2', price: BigDecimal('10'), currency: 'USD') }
  let(:creative3) { Creative.new(id: 'video-3', price: BigDecimal('13'), currency: 'EUR') }
  let(:placement) { Placement.new(id: 'plc-1', floor: BigDecimal('7.5'), currency: 'EUR') }

  describe '#call' do
    it 'returns the file content' do
      expect(subject).to eq([placement, [creative2, creative3]])
    end
  end
end
