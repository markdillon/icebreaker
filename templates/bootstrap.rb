require "net/http"
require "net/https"
require "uri"
require 'rbconfig'

def get_remote_https_file(source, destination)
  uri = URI.parse(source)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  path = File.join(destination_root, destination)
  File.open(path, "w") { |file| file.write(response.body) }
end

say "Building Application with IceBreaker..."

append_file '.gitignore' do <<-RUBY
.DS_Store
config/database.yml
public/system/**/**/**/*
.rspec
.sass-cache
DIFF*
RUBY
end

git :init

# Apply Gemfile
apply File.expand_path("../gemfile.rb", __FILE__)

# Apply Mongoid
apply File.expand_path("../mongoid.rb", __FILE__)

# Apply JQuery
apply File.expand_path("../jquery.rb", __FILE__)

# Convert to HAML
apply File.expand_path("../haml.rb", __FILE__)

# Apply Test Suite 
apply File.expand_path("../test_suite.rb", __FILE__)

# Remove RSpec stuff we are not gonna use right away
apply File.expand_path("../rspec_clean.rb", __FILE__)

# Apply rails clean up
apply File.expand_path("../rails_clean.rb", __FILE__)

# Apply RVM settings
apply File.expand_path("../rvm.rb", __FILE__)

# Install Heroku gem
apply File.expand_path("../heroku.rb", __FILE__)

git :add => "."
git :commit => "-am 'Initial Icebreaker Commit'"

say <<-D

  ########################################################################

  IceBreaker just added like 6 hours to your life.

  Next run...
  rake spec
  rails s

  ########################################################################
D
