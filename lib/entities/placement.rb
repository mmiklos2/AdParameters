# frozen_string_literal: true

require 'dry-struct'
require 'money'
require_relative '../utilities/types'

class Placement < Dry::Struct
  include Types

  attribute :id, Types::Coercible::String
  attribute :floor, Types::Coercible::Decimal
  attribute :currency, Types::Coercible::String

  def floor_in_euros
    Money.from_amount(floor, currency).exchange_to('EUR')
  end
end
