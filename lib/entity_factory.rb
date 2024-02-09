# frozen_string_literal: true

require_relative 'entities/creative'
require_relative 'entities/placement'

class EntityFactory
  # This class is responsible for creating entities from XML nodes. It could be meta-programmed to be shorter, but
  # I find explicit methods to be much faster on runtime and easier to understand.
  def self.build_creatives(creative_nodes)
    creative_nodes.map do |node|
      Creative.new(
        id: node.attribute('id'),
        price: node.attribute('price'),
        currency: node.attribute('currency')
      )
    end
  end

  def self.build_placements(placement_nodes)
    placement_nodes.map do |node|
      Placement.new(
        id: node.attribute('id'),
        floor: node.attribute('floor'),
        currency: node.attribute('currency')
      )
    end
  end
end
