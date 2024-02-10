# frozen_string_literal: true

require 'nokogiri'
require_relative 'parser'

class XmlParser < Parser
  def parse(data:)
    doc = Nokogiri::XML(data)
    doc.root.elements.any? ? doc : (raise Nokogiri::XML::SyntaxError, 'Empty XML')

    doc
  end
end
