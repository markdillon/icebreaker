# run "rails generate jquery:install --ui"
gsub_file 'app/assets/javascripts/application.js', /\/\/\= require jquery_ujs/ do
<<-RUBY
//= require jquery_ujs
//= require jquery.ui.all
RUBY
end

gsub_file 'app/assets/stylesheets/application.css', /\*= require_tree \./ do
<<-RUBY
*= require_tree .
*= require jquery.ui.all
RUBY
end