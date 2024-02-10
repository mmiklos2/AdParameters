# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/services/creatives_to_placement_matcher'
require_relative '../../lib/services/placement_processor'
require_relative '../../lib/entities/creative'
require_relative '../../lib/entities/placement'

RSpec.describe PlacementProcessor do
  subject { described_class.new.process(data_source:) }

  let(:data_source) { 'spec/fixtures/dashboard_configuration.xml' }
  let(:instantiated_creatives_to_placement_matcher) { instance_double(CreativesToPlacementMatcher) }

  before do
    allow(CreativesToPlacementMatcher).to receive(:new).and_return(instantiated_creatives_to_placement_matcher)
    allow(
      instantiated_creatives_to_placement_matcher
    ).to receive(:call).and_return([instance_double(Placement), [instance_double(Creative)]])
  end

  describe '#process' do
    it 'calls the creatives_to_placement_matcher' do
      expect(CreativesToPlacementMatcher).to receive(:new).exactly(3)

      subject
    end
  end
end
