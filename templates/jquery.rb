# run "rails generate jquery:install --ui"
gsub_file 'app/assets/javascripts/application.js', /\/\/\= require jquery_ujs/ do
<<-RUBY
//= require jquery_ujs
//= require jquery-ui
RUBY
end