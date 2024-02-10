# frozen_string_literal: true

require_relative 'placement_processor'
require_relative '../fyber/userconfiguration/creative_pb'
require_relative '../fyber/userconfiguration/placement_pb'
require_relative '../fyber/userconfiguration/placement_seq_pb'

class ProtobufBuilder
  def initialize(data_source:)
    @data_source = data_source
  end

  def call
    placement_creatives_hash = PlacementProcessor.new.process(data_source:)
    placement_sequence = placement_creatives_hash.map do |placement, creatives|
      creatives_protobufs = creatives.map do |c|
        FYBER::Userconfiguration::Creative.new(id: c.id, price: c.price_in_euros.to_f)
      end

      FYBER::Userconfiguration::Placement.new(id: placement.id, creative: creatives_protobufs)
    end

    FYBER::Userconfiguration::PlacementSeq.new(placement: placement_sequence)
  end

  private

  attr_reader :data_source
end
