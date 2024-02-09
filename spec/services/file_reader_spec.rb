# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/services/file_reader'

RSpec.describe FileReader do
  subject do
    described_class.new.read(data_source: file_path)
  end

  let(:file_path) { 'spec/fixtures/dashboard_configuration.xml' }

  describe '#read' do
    it 'returns the file content' do
      expect(subject).to be_an_instance_of(String)
    end
  end
end
