# frozen_string_literal: true

class ReaderFactory
  def self.create_reader(format)
    case format
    when :file
      FileReader.new
      # future possibility
      # when :raw_text
      #   TextParser.new
    else
      raise ArgumentError, "Unsupported format: #{format}"
    end
  end
end
