# Sandbox with RVM
create_file '.rvmrc' do
<<-RUBY
#!/usr/bin/env bash

rvm --create 1.9.3@#{app_name}

if [[ -s #{app_name}.gems ]] ; then
 rvm gemset import #{app_name}.gems
fi
RUBY
end
