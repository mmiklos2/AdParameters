# frozen_string_literal: true

require 'dry-struct'
require 'money'

class Creative < Dry::Struct
  include Types

  attribute :id, Types::Coercible::String
  attribute :price, Types::Coercible::Decimal
  attribute :currency, Types::Coercible::String

  def amount_in_money
    ::Money.from_amount(price, currency)
  end
end
