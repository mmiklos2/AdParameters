# frozen_string_literal: true

require 'nokogiri'

class XmlParser < Parser
  def parse(data:)
    Nokogiri::XML(data)
  end
end
