# frozen_string_literal: true

require_relative 'file_reader'
require_relative 'xml_parser'
require_relative '../entity_factory'
require_relative '../parser_factory'
require_relative '../reader_factory'
require_relative 'creatives_to_placement_matcher'

class PlacementProcessor
  def process(data_source:)
    @data_source = data_source
    guard_file_exists!
    guard_file_is_xml!

    parsed_xml = parser.parse(data: reader.read(data_source:))
    creatives_nodes = parsed_xml.xpath('//Creative')
    placements_nodes = parsed_xml.xpath('//Placement')
    match_placements_to_creatives(
      creatives: EntityFactory.build_creatives(creatives_nodes),
      placements: EntityFactory.build_placements(placements_nodes)
    )
  end

  private

  attr_reader :data_source

  def guard_file_exists!
    File.exist?(data_source) || (raise ArgumentError, "File not found: #{data_source}")
  end

  def guard_file_is_xml!
    File.extname(data_source) == '.xml' || (raise ArgumentError, "File not an XML: #{data_source}")
  end

  def parser
    ParserFactory.create_parser(:xml)
  end

  def reader
    ReaderFactory.create_reader(:file)
  end

  def match_placements_to_creatives(creatives:, placements:)
    placements.map do |placement|
      CreativesToPlacementMatcher.new(creatives:, placement:).call
    end.to_h
  end
end
