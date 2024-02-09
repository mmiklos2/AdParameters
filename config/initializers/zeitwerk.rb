# frozen_string_literal: true

require 'zeitwerk'

module FYBER
end

loader = Zeitwerk::Loader.new
loader.inflector.inflect 'types.rb' => 'Types'
loader.push_dir(File.join(Dir.pwd, 'lib'))
loader.push_dir(File.join(Dir.pwd, 'lib', 'entities'))
loader.push_dir(File.join(Dir.pwd, 'lib', 'fyber'), namespace: FYBER)
loader.push_dir(File.join(Dir.pwd, 'lib', 'utilities'))
loader.push_dir(File.join(Dir.pwd, 'lib', 'services'))
loader.setup
