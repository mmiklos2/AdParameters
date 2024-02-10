# frozen_string_literal: true

require_relative 'file_reader'
require_relative 'xml_parser'
require_relative '../entity_factory'
require_relative 'creatives_to_placement_matcher'

class PlacementProcessor
  def process(data_source:)
    parsed_xml = XmlParser.new.parse(data: FileReader.new.read(data_source:))
    creatives_nodes = parsed_xml.xpath('//Creative')
    placements_nodes = parsed_xml.xpath('//Placement')
    match_placements_to_creatives(
      creatives: EntityFactory.build_creatives(creatives_nodes),
      placements: EntityFactory.build_placements(placements_nodes)
    )
  end

  def match_placements_to_creatives(creatives:, placements:)
    placements.map do |placement|
      CreativesToPlacementMatcher.new(creatives:, placement:).call
    end.to_h
  end
end
