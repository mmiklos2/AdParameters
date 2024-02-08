# frozen_string_literal: true

require "zeitwerk"

module FYBER
end

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/lib/fyber", namespace: FYBER)
loader.setup
