# frozen_string_literal: true

class DataReader
  def read(data_source:)
    raise NotImplementedError, 'Subclasses must implement the read method'
  end
end
