# Create unicorn configuration file
create_file 'config/unicorn.rb' do
<<-RUBY
worker_processes 4 # amount of unicorn workers to spin up
timeout 30         # restarts workers that hang for 30 seconds
RUBY
end

# Create a foreman procfile
create_file 'Procfile' do
<<-RUBY
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
RUBY
end