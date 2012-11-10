# Sandbox with RVM
create_file '.rvmrc' do
<<-RUBY
rvm 1.9.3@#{app_name} --create

RUBY
end
