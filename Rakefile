# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yard'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

desc 'Generate documentation for Yard'
task :doc do
  sh 'yard server -r'
end

task default: :spec
