run 'rm Gemfile'
create_file 'Gemfile', "source 'http://rubygems.org'\n"

# Rails
gem "rails", "3.1.0.beta1"

# MongoID
gem "mongoid", "~> 2.0"
gem "bson_ext", "~> 1.3"

# HTML, CSS and JavaScript
gem "will_paginate", "3.0.pre2"

# Crypto
gem "bcrypt-ruby", :require => "bcrypt"

# Development dependencies
# gem 'html5-boilerplate' # TODO: Get html5-boilerplate working
gem 'rspec-rails', '2.6.0.rc6', :group => [:development]
gem 'nifty-generators'

# Development and test support
gem 'factory_girl_rails', :group => [:development, :test]
gem 'faker', :group => [:development, :test]

# Test dependencies
gem 'rspec', '2.6.0.rc6', :group => [:test]
gem 'webrat', '0.7.1', :group => [:test]

# Utilities
gem 'awesome_print', :group => [:development]
gem 'heroku', :group => :development


# Install bundled gems
run 'bundle install'
