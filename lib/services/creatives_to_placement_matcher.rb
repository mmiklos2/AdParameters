# frozen_string_literal: true

class CreativesToPlacementMatcher

  def initialize(creatives:, placement:)
    @creatives = creatives
    @placement = placement
  end

  def call
    [placement, creatives.select { |creative| creative.price_in_euros >= placement.floor_in_euros }]
  end

  attr_reader :creatives, :placement
end
