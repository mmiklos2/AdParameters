# frozen_string_literal: true

require 'bigdecimal'
require 'nokogiri'
require 'spec_helper'

RSpec.describe EntityFactory do
  let(:parsed_xml) { Nokogiri::XML(File.open('spec/fixtures/dashboard_configuration.xml')) }

  describe '#build_creatives' do
    subject { described_class.build_creatives(creatives_nodes) }

    let(:creatives_nodes) { parsed_xml.xpath('//Creative') }

    it 'returns an array of Creative objects' do
      expect(subject).to contain_exactly(
        Creative.new(id: 'Video-1', price: BigDecimal('6.4567'), currency: 'EUR'),
        Creative.new(id: 'Video-4', price: BigDecimal('1.1234'), currency: 'USD')
      )
    end
  end

  describe '#build_placements' do
    subject { described_class.build_placements(placements_nodes) }

    let(:placements_nodes) { parsed_xml.xpath('//Placement') }

    it 'returns an array of Placement objects' do
      expect(subject).to contain_exactly(
        Placement.new(id: 'plc-1', floor: BigDecimal('1.3456'), currency: 'EUR'),
        Placement.new(id: 'plc-2', floor: BigDecimal('90.234'), currency: 'SEK'),
        Placement.new(id: 'plc-3', floor: BigDecimal('8.343'), currency: 'TYR')
      )
    end
  end
end
