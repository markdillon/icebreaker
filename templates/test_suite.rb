run 'rails generate rspec:install'

# Specify rspec for generators
gsub_file 'config/application.rb', /.*config\.generators\.test_framework = false/, '    # config.generators.test_framework = false'

# MongoID Teardown
gsub_file 'spec/spec_helper.rb', /config\.fixture_path/, '# config.fixture_path'
gsub_file 'spec/spec_helper.rb', /config\.use_transactional_fixtures/, '# config.use_transactional_fixtures'
gsub_file 'spec/spec_helper.rb', /end/ do
<<-RUBY

  # Clean up the database
  require 'database_cleaner'
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end
  config.before(:each) do
    DatabaseCleaner.clean
  end
  
end
RUBY
end
