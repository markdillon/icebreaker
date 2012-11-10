require 'thor'
require 'thor/actions'
# require 'active_support/secure_random'

module IceBreaker
  class CLI < Thor
    include Thor::Actions

    desc "new [app]", "Create a new Rails 3.2.8 application"
    long_desc <<-D
      IceBreaker will ask you a few questions to determine what features you
      would like to generate. Based on your answers it will setup a new Rails 3.2.8 application.
    D
    
    def new(project)
      
      # Ensure proper version of Rails is installed
      unless `bundle exec rails -v`.chomp =~ /3.2.8/
        puts "IceBreaker requires rails 3.2.8 or greater.  Please install with the following command and then re-run the ice command:"
        puts "$ gem install rails -v 3.2.8 --no-ri --no-rdoc"
        puts "Currently getting #{`rails -v`}"
        exit 0
      end
      
      # Check for a gemset and warn if none
      gemset = `bundle exec rvm gemset name`.chomp
      unless gemset == project
        say "Your current rvm gemset name is: #{gemset}"
        say "It is recommend that you use a separate RVM gemset called '#{project}' when creating a Rails project with IceBreaker.  This will keep your system gems clean."
        say "You can exit now and create it by running this command: rvm use 1.9.2@#{project} --create"
        if yes?("Would you like to exit now and create a separate RVM gemset for #{project}?")
          exit 0
        end
      end
            
      command = "rails new #{project} --skip-active-record --skip-test-unit --template=#{template} "
      puts "Creating new Rails 3.2.8 project with: #{command}"
      exec(command)
    end

    desc "version", "Prints IceBreaker's version information"
    def version
      say "IceBreaker version #{IceBreaker::VERSION}" #TODO: This isn't working in installed gem
    end
    map %w(-v --version) => :version

    private

    def template
      File.expand_path(File.dirname(__FILE__) + "/../../templates/bootstrap.rb")
    end

  end
end