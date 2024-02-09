# frozen_string_literal: true

class Parser
  def parse(data:)
    raise NotImplementedError, 'Subclasses must implement the parse method'
  end
end
