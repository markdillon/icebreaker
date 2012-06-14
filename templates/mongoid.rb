#----------------------------------------------------------------------------
# Set up Mongoid
#----------------------------------------------------------------------------
say "creating 'config/mongoid.yml' Mongoid configuration file..."
run 'rails generate mongoid:config'

say "modifying 'config/application.rb' file for Mongoid..."
append_file 'config/application.rb' do #, :after =>  /\# require \"rails\/test_unit\/railtie\"/ do
<<-RUBY

# If you are deploying to Heroku and MongoHQ,
# you supply connection information here.
require 'uri'
if ENV['MONGOHQ_URL']
  mongo_uri = URI.parse(ENV['MONGOHQ_URL'])
  ENV['MONGOID_HOST'] = mongo_uri.host
  ENV['MONGOID_PORT'] = mongo_uri.port.to_s
  ENV['MONGOID_USERNAME'] = mongo_uri.user
  ENV['MONGOID_PASSWORD'] = mongo_uri.password
  ENV['MONGOID_DATABASE'] = mongo_uri.path.gsub('/', '')
end

RUBY
end