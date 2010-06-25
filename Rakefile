require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "time_of_day"
    gem.summary = %Q{Time without dates for Ruby and Rails 3.}
    gem.description = %Q{Adds time-only capabilities to the Time class and maps the Rails time type correctly to a time without date.}
    gem.email = "lailson@guava.com.br"
    gem.homepage = "http://github.com/lailsonbm/time_of_day"
    gem.authors = ["Lailson Bandeira"]
    gem.add_development_dependency "shoulda", ">= 2.11.1"
    gem.add_development_dependency "activesupport", ">= 3.0.0.beta4"
    gem.add_development_dependency "activerecord", ">= 3.0.0.beta4"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
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

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
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
