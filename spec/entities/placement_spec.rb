# frozen_string_literal: true

require 'bigdecimal'
require 'spec_helper'

RSpec.describe Placement do
  subject { described_class.new(id: 'video-1', floor: BigDecimal('6.4567'), currency: 'EUR') }

  it do
    expect(subject.floor_in_money).to be_a(Money)
  end
end
