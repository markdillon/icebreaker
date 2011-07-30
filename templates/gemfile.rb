append_file "Gemfile" do
<<-RUBY

# Project Gems

# View Related
gem "haml", :git => "https://github.com/nex3/haml.git"
gem 'kaminari'
gem 'gravatar_image_tag', '1.0.0.pre2'

# Object Mapper
gem "mongoid"
gem "bson_ext"

# Date/Time Parsing
# gem 'nickel', :git => "https://github.com/lzell/nickel"

# Authentication
gem "omniauth", '~> 0.2.6'
gem "bcrypt-ruby", :require => "bcrypt"

# Location Stuff
gem "simplegeo"

# FIXME: Get mongoid_geo working
# gem "mongoid_geo"

group :development do
  gem "haml-rails"
  gem "thin"
  gem "rspec-rails", "2.6.1.beta1"  
  gem "awesome_print"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem "rspec", "2.6.0"
  gem "webrat", "0.7.1"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "faker"
end

group :production do
  gem 'unicorn'
  gem 'therubyracer-heroku', '0.8.1.pre3', :group => [:production]  
end

RUBY
end

# Install bundled gems
run 'bundle install --binstubs --without production'
