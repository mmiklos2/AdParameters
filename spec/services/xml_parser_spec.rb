# frozen_string_literal: true

require 'nokogiri'
require 'spec_helper'
require_relative '../../lib/services/xml_parser'

RSpec.describe XmlParser do
  subject do
    described_class.new.parse(data: xml_data)
  end

  let(:xml_data) { File.open('spec/fixtures/dashboard_configuration.xml') }

  describe '#parse' do
    it 'returns a Nokogiri::XML::Document' do
      expect(subject).to be_an_instance_of(Nokogiri::XML::Document)
    end
  end
end
