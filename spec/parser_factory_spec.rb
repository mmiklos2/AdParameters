# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/parser_factory'
require_relative '../lib/services/xml_parser'

RSpec.describe ParserFactory do
  subject { described_class.create_parser(format) }

  context 'when format is :xml' do
    let(:format) { :xml }

    it 'creates an instance of XmlParser' do
      expect(subject).to be_an_instance_of(XmlParser)
    end
  end

  context 'when format is invalid' do
    let(:format) { :invalid }

    it 'raises an ArgumentError' do
      expect { subject }.to raise_error(ArgumentError, "Unsupported format: #{format}")
    end
  end
end
