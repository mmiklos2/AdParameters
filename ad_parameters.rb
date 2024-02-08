#!/usr/bin/env ruby
# frozen_string_literal: true

def main
  Dir['./config/initializers/*.rb'].sort.each { |file| require file }

  puts 'Hello World!'
end

main
