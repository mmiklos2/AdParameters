# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: placement.proto

require 'google/protobuf'

require_relative 'creative_pb'


descriptor_data = "\n\x0fplacement.proto\x12\x17\x46YBER.userconfiguration\x1a\x0e\x63reative.proto\"L\n\tPlacement\x12\n\n\x02id\x18\x01 \x02(\t\x12\x33\n\x08\x63reative\x18\x02 \x03(\x0b\x32!.FYBER.userconfiguration.Creative"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
    ["FYBER.userconfiguration.Creative", "creative.proto"],
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module FYBER
  module Userconfiguration
    Placement = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("FYBER.userconfiguration.Placement").msgclass
  end
end
