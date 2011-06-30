append_file "Gemfile" do
<<-RUBY

# Project Gems

RUBY
end
# Rails

# MongoID
gem "mongoid"
gem "bson_ext"

# HTML, CSS and JavaScript
gem "haml", :git => "https://github.com/nex3/haml.git"
gem 'kaminari'

# Development dependencies
gem "rspec-rails", "2.6.1"

# Facebook, Twitter, etc. OAuth Authentication
gem "omniauth"

# Development and test support
gem 'factory_girl_rails', :group => [:development, :test]
gem 'faker', :group => [:development, :test]

# Test dependencies
gem 'rspec', '2.6.0', :group => [:test]
gem 'webrat', '0.7.1', :group => [:test]

# Heroku Support
gem 'therubyracer-heroku', '0.8.1.pre3', :group => [:production]

# Install bundled gems
run 'bundle install'
