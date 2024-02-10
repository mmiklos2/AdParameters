# frozen_string_literal: true

require 'nokogiri'
require_relative 'parser'

class XmlParser < Parser
  def parse(data:)
    doc = Nokogiri::XML(data)
    raise Nokogiri::XML::SyntaxError, 'Empty XML' if doc.root.elements.none?

    # raise Nokogiri::XML::SyntaxError, 'Invalid XML' unless doc.errors.empty?

    doc
  end
end
