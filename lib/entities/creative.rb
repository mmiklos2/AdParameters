# frozen_string_literal: true

require 'dry-struct'
require 'money'

class Creative < Dry::Struct
  include Types

  attribute :id, Types::Coercible::String
  attribute :price, Types::Coercible::Decimal
  attribute :currency, Types::Coercible::String

  def price_in_euros
    Money.from_amount(price, currency).exchange_to('EUR')
  end
end
