# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ReaderFactory do
  subject { described_class.create_reader(format) }

  context 'when format is :file' do
    let(:format) { :file }

    it 'creates an instance of FileReader' do
      expect(subject).to be_an_instance_of(FileReader)
    end
  end

  context 'when format is invalid' do
    let(:format) { :invalid }

    it 'raises an ArgumentError' do
      expect { subject }.to raise_error(ArgumentError, "Unsupported format: #{format}")
    end
  end
end
