# frozen_string_literal: true

class FileReader < DataReader
  def read(data_source:)
    @data = File.read(data_source)
  end

  attr_reader :data
end
