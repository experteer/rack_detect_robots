require 'rubygems'
require 'rake'
require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/lib/**/*_spec.rb'
  end

  RSpec::Core::RakeTask.new(:rcov) do |spec|
    spec.pattern = 'spec/lib/**/*_spec.rb'
    spec.rcov = true
  end

  task :default => :spec
rescue LoadError
  warn "no rspec no spec tasks"
end

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rack-detect-robots #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "rack_detect_robots"
    gemspec.authors = ["Peter Schrammel"]
    gemspec.homepage = "http://github.com/experteer/rack_detect_robots"
    gemspec.summary = "Rack Middleware for detecting robots"
    gemspec.add_dependency('rack', '>= 0.9.1')
    gemspec.files = Dir.glob('lib/**/*.rb')
  end
rescue LoadError
  warn "no jeweler so no gemspec tasks"
end