# frozen_string_literal: true

require 'money'

I18n.config.available_locales = :en
Money.locale_backend = :i18n
Money.default_currency = Money::Currency.new('EUR')
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

# Register TYR as a currency
Money::Currency.register(
  {
    priority: 1,
    iso_code: 'TYR',
    name: 'Turkish Lira',
    symbol: '₺',
    subunit: 'Kuruş',
    subunit_to_unit: 100,
    separator: '.',
    delimiter: ','
  }
)

Money.add_rate('EUR', 'TYR', 3.31)
Money.add_rate('EUR', 'USD', 1.13)
Money.add_rate('EUR', 'SEK', 11.29)
