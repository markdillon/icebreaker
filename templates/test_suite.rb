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

# cucumber_install = 'rails generate cucumber:install --capybara --rspec'
# cucumber_install = "#{cucumber_install} --skip-database" if ENV['MOLOGUE_MONGOID']
# run cucumber_install
# 
# if ENV['MOLOGUE_MONGOID']
#   append_file 'features/support/env.rb' do
#     <<-RUBY
# 
#     # Clean MongoDB between tests
#     require 'database_cleaner'
#     DatabaseCleaner.strategy = :truncation
#     Before do
#       DatabaseCleaner.clean
#     end
# 
#     RUBY
#   end
# end
# 
# run 'rails generate pickle --email'
# 
# test_framework = "g.test_framework :rspec"
# test_framework = "#{test_framework}, :fixture => false" if ENV['MOLOGUE_MONGOID']
# inject_into_file 'config/application.rb', :after => "# Configure the default encoding used in templates for Ruby 1.9.\n" do
# <<-RUBY
#     config.generators do |g|
#       #{test_framework}
#     end
# RUBY
# end
# 
# inject_into_file 'features/support/env.rb', :after => "ENV[\"RAILS_ENV\"] ||= \"test\"\n" do 
# <<-RUBY
# $VERBOSE = nil
# RUBY
# end
# 
# gsub_file 'features/support/env.rb',/require 'cucumber\/rails\/capybara_javascript_emulation'/,'#require \'cucumber/rails/capybara_javascript_emulation\''
# 
# run 'mkdir spec/factories'
# 
# create_file 'features/step_definitions/web_steps_extended.rb' do
# <<-'FILE'
# When /^I confirm a js popup on the next step$/ do
#   page.evaluate_script("window.alert = function(msg) { return true; }")
#   page.evaluate_script("window.confirm = function(msg) { return true; }")
# end
# 
# When /^I perform the following actions:$/ do |table|
#   table.hashes.each do |row|
#     case row['Action']
#     when 'Fill in'
#       Given "I fill in \"#{row['Field']}\" with \"#{row['Value']}\""
#     when 'Check'
#       if row['Value'] =~ /true/
#         Given "I check \"#{row['Field']}\""
#       else
#         Given "I uncheck \"#{row['Field']}\""
#       end
#     when 'Choose'
#       Given "I choose \"#{row['Field']}\""
#     end
#   end
# end
# FILE
# end
# 
# create_file 'features/step_definitions/factory_steps.rb' do
# <<-'FILE'
# Given /^the following (.+) records?$/ do |factory, table|
#   table.hashes.each do |hash|
#     hash.each{|k,v| hash[k] = nil if v == "nil" } # FIXME: hack to make resend_email_verification.feature work
#     Factory(factory, hash)
#   end
# end
# FILE
# end