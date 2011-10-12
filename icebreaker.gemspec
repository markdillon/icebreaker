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
  s.description = "Generate a Rails 3.1.1 app with the Mongoid ORM (or OM) and RSpec for BDD testing."

  s.rubyforge_project         = "icebreaker"

  s.add_dependency "thor"
  s.add_development_dependency "bundler"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
