run 'rm Gemfile'
create_file 'Gemfile', "source 'http://rubygems.org'\n"

# Rails
gem "rails", "3.0.4"

# MongoID
gem "mongoid", "2.0.0.rc.7"
gem 'bson', '1.2.1'
gem 'bson_ext', '1.2.1'

# HTML, CSS and JavaScript
gem "haml-rails"
gem "will_paginate", "3.0.pre2"

# JavaScript
gem "jquery-rails"

# Development dependencies
# gem 'html5-boilerplate' # TODO: Get html5-boilerplate working
gem 'rspec-rails', '2.5.0', :group => [:development]
gem 'nifty-generators'

# Development and test support
gem 'factory_girl_rails', :group => [:development, :test]
gem 'faker', :group => [:development, :test]

# Test dependencies
gem 'rspec', '2.5.0', :group => [:test]
gem 'webrat', '0.7.1', :group => [:test]

# Utilities
gem 'awesome_print', :group => [:development]
gem 'heroku', :group => :development


# Install bundled gems
run 'bundle install'
