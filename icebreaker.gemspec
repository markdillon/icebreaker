# -*- encoding: utf-8 -*-
require File.expand_path("../lib/icebreaker/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "icebreaker"
  s.version     = IceBreaker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mark Dillon"]
  s.email       = ["mdillon@gmail.com"]
  s.homepage    = "http://github.com/markdillon/icebreaker"
  s.summary     = "icebreaker-#{s.version}"
  s.description = "Generate a Rails 3 app with the Mongoid ORM (or OM) and RSpec for BDD testing."

  s.required_rubygems_version = "~> 1.6.0"
  s.rubyforge_project         = "icebreaker"

  s.add_dependency "thor"
  # s.add_dependency "mail" # Hack to get around "mail requires i18n (~> 0.4.1, runtime)" error
  s.add_dependency "rails", '3.1.0.beta1'
  s.add_development_dependency "bundler"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
