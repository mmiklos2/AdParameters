# frozen_string_literal: true

require 'nokogiri'
require 'spec_helper'
require_relative '../../lib/services/xml_parser'

RSpec.describe XmlParser do
  subject do
    described_class.new.parse(data: xml_data)
  end

  describe '#parse' do
    let(:xml_data) { File.open('spec/fixtures/dashboard_configuration.xml') }

    it 'returns a Nokogiri::XML::Document' do
      expect(subject).to be_an_instance_of(Nokogiri::XML::Document)
    end

    context 'when the XML is empty' do
      let(:xml_data) { File.open('spec/fixtures/empty_dashboard_configuration.xml') }

      it 'raises an error' do
        expect { subject }.to raise_error(Nokogiri::XML::SyntaxError)
      end
    end

    # Nokogiri does not support any XML above 1.0
    # context 'when the XML is not valid' do
    #   let(:xml_data) { File.open('spec/fixtures/malformed.xml') }
    #
    #   it 'raises an error' do
    #     expect { subject }.to raise_error(Nokogiri::XML::SyntaxError)
    #   end
    # end
  end
end
