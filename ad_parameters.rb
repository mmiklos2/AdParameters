#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/services/placement_processor'
require_relative 'lib/fyber/userconfiguration/creative_pb'
require_relative 'lib/fyber/userconfiguration/placement_pb'
require_relative 'lib/fyber/userconfiguration/placement_seq_pb'
require_relative 'config/initializers/money'

def main
  placement_creatives_hash = PlacementProcessor.new.process(data_source: 'example.xml')
  placement_sequence = placement_creatives_hash.map do |placement, creatives|
    creatives_protobufs = creatives.map do |c|
      FYBER::Userconfiguration::Creative.new(id: c.id, price: c.price_in_euros.to_f)
    end

    FYBER::Userconfiguration::Placement.new(id: placement.id, creative: creatives_protobufs)
  end

  puts FYBER::Userconfiguration::PlacementSeq.new(placement: placement_sequence)
end

main
