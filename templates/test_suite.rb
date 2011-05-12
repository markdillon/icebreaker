run 'rails generate rspec:install'

# MongoID Teardown
gsub_file 'spec/spec_helper.rb', /config\.fixture_path/, '# config.fixture_path'
gsub_file 'spec/spec_helper.rb', /config\.use_transactional_fixtures/, '# config.use_transactional_fixtures'
gsub_file 'spec/spec_helper.rb', /end/ do
<<-RUBY
  config.before :each do
    Mongoid.master.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end
RUBY
end
