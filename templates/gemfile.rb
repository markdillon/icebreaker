append_file "Gemfile" do
<<-RUBY

# Project Gems

# View Related
gem "haml"
gem "kaminari"
gem "gravatar_image_tag", "1.0.0.pre2"

# Object Mapper
gem "mongoid"
gem "bson_ext"

# Date/Time Parsing
# gem 'nickel', :git => "https://github.com/lzell/nickel"

# Authentication
gem "omniauth"

group :development do
  gem "haml-rails"
  gem "rspec-rails"
  gem "awesome_print"
end

group :test do
  # Pretty printed test output
  gem "turn", :require => false
  gem "rspec"
  gem "capybara"
  gem "launchy"
end

group :development, :test do
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "faker"
end

group :production do
  gem "unicorn"
  gem "therubyracer-heroku", "0.8.1.pre3", :group => [:production]  
end

RUBY
end

# Install bundled gems
run 'bundle install --binstubs --without production'
