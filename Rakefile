require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "time_of_day"
    gem.summary = %Q{Handle correctly times without dates in Rails 3.}
    gem.description = %Q{Adds time-only capabilities to the Time class and maps the Rails time type correctly to a time without date.}
    gem.email = "lailson@guava.com.br"
    gem.homepage = "http://github.com/lailsonbm/time_of_day"
    gem.authors = ["Lailson Bandeira"]
    gem.add_dependency "activesupport", ">= 3.0.0.rc"
    gem.add_dependency "activerecord", ">= 3.0.0.rc"
    gem.add_development_dependency "shoulda", ">= 2.11.1"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "time_of_day #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
