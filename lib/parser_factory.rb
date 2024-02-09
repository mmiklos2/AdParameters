# frozen_string_literal: true

class ParserFactory
  def self.create_parser(format)
    case format
    when :xml
      XmlParser.new
      # future possibility
      # when :json
      #   JSONParser.new
    else
      raise ArgumentError, "Unsupported format: #{format}"
    end
  end
end
