append_file "Gemfile" do
<<-RUBY

# Project Gems

# View Related
gem "haml"
gem "kaminari"
gem 'bootstrap-sass-rails', :group => :assets
gem 'jquery-ui-rails', :group => :assets

# Object Mapper
gem "mongoid", "~> 3.0.11"

group :development do
  gem "haml-rails"
  gem "rspec-rails"
end

group :test do
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
  # gem "newrelic_rpm"
end

RUBY
end

# Install bundled gems
run 'bundle install --without production'
