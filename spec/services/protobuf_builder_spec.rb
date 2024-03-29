# frozen_string_literal: true

require_relative '../../lib/services/protobuf_builder'
require_relative '../../lib/fyber/userconfiguration/creative_pb'
require_relative '../../lib/fyber/userconfiguration/placement_pb'
require_relative '../../lib/fyber/userconfiguration/placement_seq_pb'

RSpec.describe ProtobufBuilder do
  subject { described_class.new(data_source:).call }

  let(:data_source) { File.join(Dir.pwd, 'example.xml') }
  let(:expected_output) do
    FYBER::Userconfiguration::PlacementSeq.new(
      placement: [
        FYBER::Userconfiguration::Placement.new(
          id: 'plc-1',
          creative: [
            FYBER::Userconfiguration::Creative.new(id: 'Video-1', price: 6.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-7', price: 4.88),
            FYBER::Userconfiguration::Creative.new(id: 'Video-12', price: 16.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-25', price: 8.37)
          ]
        ),
        FYBER::Userconfiguration::Placement.new(
          id: 'plc-2',
          creative: [
            FYBER::Userconfiguration::Creative.new(id: 'Video-12', price: 16.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-25', price: 8.37)
          ]
        ),
        FYBER::Userconfiguration::Placement.new(
          id: 'plc-3',
          creative: [
            FYBER::Userconfiguration::Creative.new(id: 'Video-1', price: 6.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-7', price: 4.88),
            FYBER::Userconfiguration::Creative.new(id: 'Video-12', price: 16.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-25', price: 8.37)
          ]
        ),
        FYBER::Userconfiguration::Placement.new(
          id: 'plc-4',
          creative: []
        ),
        FYBER::Userconfiguration::Placement.new(
          id: 'plc-5',
          creative: []
        ),
        FYBER::Userconfiguration::Placement.new(
          id: 'plc-6',
          creative: [
            FYBER::Userconfiguration::Creative.new(id: 'Video-1', price: 6.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-7', price: 4.88),
            FYBER::Userconfiguration::Creative.new(id: 'Video-12', price: 16.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-25', price: 8.37)
          ]
        ),
        FYBER::Userconfiguration::Placement.new(
          id: 'plc-7',
          creative: [
            FYBER::Userconfiguration::Creative.new(id: 'Video-1', price: 6.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-4', price: 0.99),
            FYBER::Userconfiguration::Creative.new(id: 'Video-7', price: 4.88),
            FYBER::Userconfiguration::Creative.new(id: 'Video-12', price: 16.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-25', price: 8.37)
          ]
        ),
        FYBER::Userconfiguration::Placement.new(
          id: 'plc-8',
          creative: [
            FYBER::Userconfiguration::Creative.new(id: 'Video-1', price: 6.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-7', price: 4.88),
            FYBER::Userconfiguration::Creative.new(id: 'Video-12', price: 16.46),
            FYBER::Userconfiguration::Creative.new(id: 'Video-25', price: 8.37)
          ]
        )
      ]
    )
  end

  it 'outputs the PlacementSeq protobuf to stdout' do
    expect(subject).to eq(expected_output)
  end
end
