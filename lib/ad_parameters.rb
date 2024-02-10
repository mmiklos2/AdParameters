#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'services/protobuf_builder'
require_relative '../config/initializers/money'

def main
  (raise ArgumentError, 'File name not provided!') if ARGV[0].nil?

  puts ProtobufBuilder.new(data_source: ARGV[0]).call
end

main
