# frozen_string_literal: true

require 'dry-struct'
require 'money'

class Placement < Dry::Struct
  include Types

  attribute :id, Types::Coercible::String
  attribute :floor, Types::Coercible::Decimal
  attribute :currency, Types::Coercible::String

  def floor_in_money
    ::Money.from_amount(floor, currency)
  end
end
