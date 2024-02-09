# frozen_string_literal: true

require 'nokogiri'
require_relative 'parser'

class XmlParser < Parser
  def parse(data:)
    Nokogiri::XML(data)
  end
end
