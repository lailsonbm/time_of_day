# -*- encoding: utf-8 -*-
require File.expand_path('../lib/time_of_day/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'time_of_day'
  s.version     = TimeOfDay::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = %q{Lailson Bandeira}
  s.email       = %q{lailson@guava.com.br}
  s.homepage    = 'http://rubygems.org/gems/time_of_day'
  s.summary     = 'Handle correctly times without dates in Rails 3.'
  s.description = 'Adds time-only capabilities to the Time class and maps the Rails time type correctly to a time without date.'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'time_of_day'

  s.add_development_dependency 'bundler', '>= 1.0.0'
  s.add_development_dependency 'shoulda', '>= 2.11.3'
  s.add_runtime_dependency('activesupport', '>= 3.0.0')
  s.add_runtime_dependency('activerecord', '>= 3.0.0')

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
