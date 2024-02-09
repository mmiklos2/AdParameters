#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/services/processor'

def main
  Dir['./config/initializers/*.rb'].sort.each { |file| require file }

  Processor.new.process(data_source: 'example.xml')
end

main
